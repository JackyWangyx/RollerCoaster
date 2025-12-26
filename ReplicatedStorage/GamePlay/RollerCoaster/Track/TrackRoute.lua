local TrackSection = require(game.ReplicatedStorage.ScriptAlias.TrackSection)

local TrackRoute = {}

TrackRoute.__index = TrackRoute

function TrackRoute.new(segmentList)
	local self = setmetatable({}, TrackRoute)

	self.SegmentList = segmentList
	self:InitPath()
	
	return self
end

function TrackRoute:InitPath()
	local length = 0
	
	self.SectionList = {}
	for _, segment in ipairs(self.SegmentList) do
		local trackSection = TrackSection.new(segment)
		table.insert(self.SectionList, trackSection)
	end
	
	self.PointList = {}
	local lastPoint = nil
	for sectionIndex, section in ipairs(self.SectionList) do
		for pointIndex, point in ipairs(section.PointList) do
			local len = 0
			if lastPoint then
				len = (point.Position - lastPoint.Position).Magnitude
			end

			lastPoint = point
			length += len
			local pointData = {
				Position = point.Position,
				Rotation = point.Rotation,
				Distance = length,
			}
			
			table.insert(self.PointList, pointData)
		end
	end
	
	self.Length = length
end

function TrackRoute:GetPointByFactor(factor)
	if factor <= 0 then
		return {
			Position = self.PointList[1].Position,
			Rotation = self.PointList[1].Rotation,
		}
	end
	if factor >= 1 then
		return {
			Position = self.PointList[#self.PointList].Position,
			Rotation = self.PointList[#self.PointList].Rotation,
		}
	end
	local distance = factor * self.Length
	return self:GetPointByDistance(distance)
end

function TrackRoute:GetPointByDistance(distance)
	distance = math.clamp(distance, 0, self.Length)
	
	if distance <= 0 then
		return {
			Position = self.PointList[1].Position,
			Rotation = self.PointList[1].Rotation,
		}
	end
	
	if distance >= self.Length then
		return {
			Position = self.PointList[#self.PointList].Position,
			Rotation = self.PointList[#self.PointList].Rotation,
		}
	end
	
	for i = 1, #self.PointList - 1 do
		local p1 = self.PointList[i]
		local p2 = self.PointList[i + 1]
		if p1.Distance <= distance and distance < p2.Distance then
			local segDist = p2.Distance - p1.Distance
			if segDist <= 0 then
				return {
					Position = p1.Position,
					Rotation = p1.Rotation,
				}
			end
			local alpha = math.clamp((distance - p1.Distance) / segDist, 0, 1)

			local pos = p1.Position:lerp(p2.Position, alpha)
			local rot = p1.Rotation:lerp(p2.Rotation, alpha)

			return {
				Position = pos,
				Rotation = rot,
			}
		end
	end

	return {
		Position = self.PointList[#self.PointList].Position,
		Rotation = self.PointList[#self.PointList].Rotation,
	}
end

function TrackRoute:GetNearestPathDistance(position)
	if #self.PointList < 2 then
		return 0
	end

	local minSpatialDist = math.huge
	local nearestPathDist = 0

	for i = 1, #self.PointList - 1 do
		local p1 = self.PointList[i]
		local p2 = self.PointList[i + 1]
		local dir = p2.Position - p1.Position
		local dirLengthSq = dir:Dot(dir)

		local segPathDist = p2.Distance - p1.Distance
		if dirLengthSq > 0 and segPathDist > 0 then
			local t = ((position - p1.Position):Dot(dir)) / dirLengthSq
			t = math.clamp(t, 0, 1)
			local nearestPoint = p1.Position + dir * t
			local spatialDist = (position - nearestPoint).Magnitude
			local pathDist = p1.Distance + t * segPathDist

			if spatialDist < minSpatialDist then
				minSpatialDist = spatialDist
				nearestPathDist = pathDist
			end
		else
			local distToP1 = (position - p1.Position).Magnitude
			if distToP1 < minSpatialDist then
				minSpatialDist = distToP1
				nearestPathDist = p1.Distance
			end
		end
	end

	local distToStart = (position - self.PointList[1].Position).Magnitude
	local distToEnd = (position - self.PointList[#self.PointList].Position).Magnitude
	if distToStart < minSpatialDist then
		minSpatialDist = distToStart
		nearestPathDist = 0
	end
	if distToEnd < minSpatialDist then
		minSpatialDist = distToEnd
		nearestPathDist = self.Length
	end

	return nearestPathDist
end

return TrackRoute
