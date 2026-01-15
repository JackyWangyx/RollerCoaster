local PetConfig = {}

PetConfig.Data = [=[
ID,Name,Rarity,Icon,Prefab,Size,Indexable,World,MaxExistCoinFactor,GetCoinFactor1,DisplayGetPowerFactor,ProductKey
1,Doggy,1,rbxassetid://86721141310393,PetNew/Rank01/Egg01_01_Doggy,Tiny,true,1,0,2,2X,nil
2,Doggy,1,rbxassetid://86721141310393,PetNew/Rank01/Egg01_01_Doggy_Mid,Normal,false,1,0,2.4,2.4X,nil
3,Doggy,1,rbxassetid://86721141310393,PetNew/Rank01/Egg01_01_Doggy_Large,Large,false,1,0,3,3X,nil
4,Doggy,1,rbxassetid://86721141310393,PetNew/Rank01/Egg01_01_Doggy,nil,false,1,0,1,1X,nil
5,Doggy,1,rbxassetid://86721141310393,PetNew/Rank01/Egg01_01_Doggy,nil,false,1,0,1,1X,nil
6,Dino,2,rbxassetid://92374459990750,PetNew/Rank01/Egg01_02_Dino,Tiny,true,1,0,3,3X,nil
7,Dino,2,rbxassetid://92374459990750,PetNew/Rank01/Egg01_02_Dino_Mid,Normal,false,1,0,3.6,3.6X,nil
8,Dino,2,rbxassetid://92374459990750,PetNew/Rank01/Egg01_02_Dino_Large,Large,false,1,0,4.5,4.5X,nil
9,Dino,2,rbxassetid://92374459990750,PetNew/Rank01/Egg01_02_Dino,nil,false,1,0,1,1X,nil
10,Dino,2,rbxassetid://92374459990750,PetNew/Rank01/Egg01_02_Dino,nil,false,1,0,1,1X,nil
11,Panda,3,rbxassetid://118920667823004,PetNew/Rank01/Egg01_03_Panda,Tiny,true,1,0,4,4X,nil
12,Panda,3,rbxassetid://118920667823004,PetNew/Rank01/Egg01_03_Panda_Mid,Normal,false,1,0,4.8,4.8X,nil
13,Panda,3,rbxassetid://118920667823004,PetNew/Rank01/Egg01_03_Panda_Large,Large,false,1,0,6,6X,nil
14,Panda,3,rbxassetid://118920667823004,PetNew/Rank01/Egg01_03_Panda,nil,false,1,0,1,1X,nil
15,Panda,3,rbxassetid://118920667823004,PetNew/Rank01/Egg01_03_Panda,nil,false,1,0,1,1X,nil
16,Piggy,4,rbxassetid://127509215972299,PetNew/Rank01/Egg01_04_Piggy,Tiny,true,1,0,6,6X,nil
17,Piggy,4,rbxassetid://127509215972299,PetNew/Rank01/Egg01_04_Piggy_Mid,Normal,false,1,0,7.2,7.2X,nil
18,Piggy,4,rbxassetid://127509215972299,PetNew/Rank01/Egg01_04_Piggy_Large,Large,false,1,0,9,9X,nil
19,Piggy,4,rbxassetid://127509215972299,PetNew/Rank01/Egg01_04_Piggy,nil,false,1,0,1,1X,nil
20,Piggy,4,rbxassetid://127509215972299,PetNew/Rank01/Egg01_04_Piggy,nil,false,1,0,1,1X,nil
21,Kitty,5,rbxassetid://133950983951104,PetNew/Rank01/Egg01_05_Kitty,Tiny,true,1,0,8,8X,nil
22,Kitty,5,rbxassetid://133950983951104,PetNew/Rank01/Egg01_05_Kitty_Mid,Normal,false,1,0,9.6,9.6X,nil
23,Kitty,5,rbxassetid://133950983951104,PetNew/Rank01/Egg01_05_Kitty_Large,Large,false,1,0,12,12X,nil
24,Kitty,5,rbxassetid://133950983951104,PetNew/Rank01/Egg01_05_Kitty,nil,false,1,0,1,1X,nil
25,Kitty,5,rbxassetid://133950983951104,PetNew/Rank01/Egg01_05_Kitty,nil,false,1,0,1,1X,nil
26,Wolf,1,rbxassetid://125481752865893,PetNew/Rank01/Egg250_01_Wolf,Tiny,true,1,0,9,9X,nil
27,Wolf,1,rbxassetid://125481752865893,PetNew/Rank01/Egg250_01_Wolf_Mid,Normal,false,1,0,10.8,10.8X,nil
28,Wolf,1,rbxassetid://125481752865893,PetNew/Rank01/Egg250_01_Wolf_Large,Large,false,1,0,13.5,13.5X,nil
29,Wolf,1,rbxassetid://125481752865893,PetNew/Rank01/Egg250_01_Wolf,nil,false,1,0,1,1X,nil
30,Wolf,1,rbxassetid://125481752865893,PetNew/Rank01/Egg250_01_Wolf,nil,false,1,0,1,1X,nil
31,Bear,2,rbxassetid://108398654343385,PetNew/Rank01/Egg250_02_Bear,Tiny,true,1,0,11,11X,nil
32,Bear,2,rbxassetid://108398654343385,PetNew/Rank01/Egg250_02_Bear_Mid,Normal,false,1,0,13.2,13.2X,nil
33,Bear,2,rbxassetid://108398654343385,PetNew/Rank01/Egg250_02_Bear_Large,Large,false,1,0,16.5,16.5X,nil
34,Bear,2,rbxassetid://108398654343385,PetNew/Rank01/Egg250_02_Bear,nil,false,1,0,1,1X,nil
35,Bear,2,rbxassetid://108398654343385,PetNew/Rank01/Egg250_02_Bear,nil,false,1,0,1,1X,nil
36,Deer,3,rbxassetid://119658014755716,PetNew/Rank01/Egg250_03_Deer,Tiny,true,1,0,14,14X,nil
37,Deer,3,rbxassetid://119658014755716,PetNew/Rank01/Egg250_03_Deer_Mid,Normal,false,1,0,16.8,16.8X,nil
38,Deer,3,rbxassetid://119658014755716,PetNew/Rank01/Egg250_03_Deer_Large,Large,false,1,0,21,21X,nil
39,Deer,3,rbxassetid://119658014755716,PetNew/Rank01/Egg250_03_Deer,nil,false,1,0,1,1X,nil
40,Deer,3,rbxassetid://119658014755716,PetNew/Rank01/Egg250_03_Deer,nil,false,1,0,1,1X,nil
41,Bunny,4,rbxassetid://112465102440206,PetNew/Rank01/Egg250_04_Bunny,Tiny,true,1,0,19,19X,nil
42,Bunny,4,rbxassetid://112465102440206,PetNew/Rank01/Egg250_04_Bunny_Mid,Normal,false,1,0,22.8,22.8X,nil
43,Bunny,4,rbxassetid://112465102440206,PetNew/Rank01/Egg250_04_Bunny_Large,Large,false,1,0,28.5,28.5X,nil
44,Bunny,4,rbxassetid://112465102440206,PetNew/Rank01/Egg250_04_Bunny,nil,false,1,0,1,1X,nil
45,Bunny,4,rbxassetid://112465102440206,PetNew/Rank01/Egg250_04_Bunny,nil,false,1,0,1,1X,nil
46,Fox,5,rbxassetid://105059624130297,PetNew/Rank01/Egg250_05_Fox,Tiny,true,1,0,25,25X,nil
47,Fox,5,rbxassetid://105059624130297,PetNew/Rank01/Egg250_05_Fox_Mid,Normal,false,1,0,30,30X,nil
48,Fox,5,rbxassetid://105059624130297,PetNew/Rank01/Egg250_05_Fox_Large,Large,false,1,0,37.5,37.5X,nil
49,Fox,5,rbxassetid://105059624130297,PetNew/Rank01/Egg250_05_Fox,nil,false,1,0,1,1X,nil
50,Fox,5,rbxassetid://105059624130297,PetNew/Rank01/Egg250_05_Fox,nil,false,1,0,1,1X,nil
51,Voltiki,1,rbxassetid://121931478506491,PetNew/Rank01/Egg3K_01_Voltiki,Tiny,true,1,0,31,31X,nil
52,Voltiki,1,rbxassetid://121931478506491,PetNew/Rank01/Egg3K_01_Voltiki_Mid,Normal,false,1,0,37.2,37.2X,nil
53,Voltiki,1,rbxassetid://121931478506491,PetNew/Rank01/Egg3K_01_Voltiki_Large,Large,false,1,0,46.5,46.5X,nil
54,Voltiki,1,rbxassetid://121931478506491,PetNew/Rank01/Egg3K_01_Voltiki,nil,false,1,0,1,1X,nil
55,Voltiki,1,rbxassetid://121931478506491,PetNew/Rank01/Egg3K_01_Voltiki,nil,false,1,0,1,1X,nil
56,Spiketra,2,rbxassetid://133991851771294,PetNew/Rank01/Egg3K_02_Spiketra,Tiny,true,1,0,35,35X,nil
57,Spiketra,2,rbxassetid://133991851771294,PetNew/Rank01/Egg3K_02_Spiketra_Mid,Normal,false,1,0,42,42X,nil
58,Spiketra,2,rbxassetid://133991851771294,PetNew/Rank01/Egg3K_02_Spiketra_Large,Large,false,1,0,52.5,52.5X,nil
59,Spiketra,2,rbxassetid://133991851771294,PetNew/Rank01/Egg3K_02_Spiketra,nil,false,1,0,1,1X,nil
60,Spiketra,2,rbxassetid://133991851771294,PetNew/Rank01/Egg3K_02_Spiketra,nil,false,1,0,1,1X,nil
61,Frozbite,3,rbxassetid://121954968563489,PetNew/Rank01/Egg3K_03_Frozbite,Tiny,true,1,0,40,40X,nil
62,Frozbite,3,rbxassetid://121954968563489,PetNew/Rank01/Egg3K_03_Frozbite_Mid,Normal,false,1,0,48,48X,nil
63,Frozbite,3,rbxassetid://121954968563489,PetNew/Rank01/Egg3K_03_Frozbite_Large,Large,false,1,0,60,60X,nil
64,Frozbite,3,rbxassetid://121954968563489,PetNew/Rank01/Egg3K_03_Frozbite,nil,false,1,0,1,1X,nil
65,Frozbite,3,rbxassetid://121954968563489,PetNew/Rank01/Egg3K_03_Frozbite,nil,false,1,0,1,1X,nil
66,Halochi,4,rbxassetid://75914773369312,PetNew/Rank01/Egg3K_04_Halochi,Tiny,true,1,0,47,47X,nil
67,Halochi,4,rbxassetid://75914773369312,PetNew/Rank01/Egg3K_04_Halochi_Mid,Normal,false,1,0,56.4,56.4X,nil
68,Halochi,4,rbxassetid://75914773369312,PetNew/Rank01/Egg3K_04_Halochi_Large,Large,false,1,0,70.5,70.5X,nil
69,Halochi,4,rbxassetid://75914773369312,PetNew/Rank01/Egg3K_04_Halochi,nil,false,1,0,1,1X,nil
70,Halochi,4,rbxassetid://75914773369312,PetNew/Rank01/Egg3K_04_Halochi,nil,false,1,0,1,1X,nil
71,Noctobrax,5,rbxassetid://94388847485730,PetNew/Rank01/Egg3K_05_Noctobrax,Tiny,true,1,0,54,54X,nil
72,Noctobrax,5,rbxassetid://94388847485730,PetNew/Rank01/Egg3K_05_Noctobrax_Mid,Normal,false,1,0,64.8,64.8X,nil
73,Noctobrax,5,rbxassetid://94388847485730,PetNew/Rank01/Egg3K_05_Noctobrax_Large,Large,false,1,0,81,81X,nil
74,Noctobrax,5,rbxassetid://94388847485730,PetNew/Rank01/Egg3K_05_Noctobrax,nil,false,1,0,1,1X,nil
75,Noctobrax,5,rbxassetid://94388847485730,PetNew/Rank01/Egg3K_05_Noctobrax,nil,false,1,0,1,1X,nil
76,Solureon,1,rbxassetid://118876479023519,PetNew/Rank02/Egg50K_01_Solureon,Tiny,true,1,0,215,215X,nil
77,Solureon,1,rbxassetid://118876479023519,PetNew/Rank02/Egg50K_01_Solureon_Mid,Normal,false,1,0,258,258X,nil
78,Solureon,1,rbxassetid://118876479023519,PetNew/Rank02/Egg50K_01_Solureon_Large,Large,false,1,0,322.5,322.5X,nil
79,Solureon,1,rbxassetid://118876479023519,PetNew/Rank02/Egg50K_01_Solureon,nil,false,1,0,1,1X,nil
80,Solureon,1,rbxassetid://118876479023519,PetNew/Rank02/Egg50K_01_Solureon,nil,false,1,0,1,1X,nil
81,Glaciarch,2,rbxassetid://101579878256245,PetNew/Rank02/Egg50K_02_Glaciarch,Tiny,true,1,0,246,246X,nil
82,Glaciarch,2,rbxassetid://101579878256245,PetNew/Rank02/Egg50K_02_Glaciarch_Mid,Normal,false,1,0,295.2,295.2X,nil
83,Glaciarch,2,rbxassetid://101579878256245,PetNew/Rank02/Egg50K_02_Glaciarch_Large,Large,false,1,0,369,369X,nil
84,Glaciarch,2,rbxassetid://101579878256245,PetNew/Rank02/Egg50K_02_Glaciarch,nil,false,1,0,1,1X,nil
85,Glaciarch,2,rbxassetid://101579878256245,PetNew/Rank02/Egg50K_02_Glaciarch,nil,false,1,0,1,1X,nil
86,Verdantis,3,rbxassetid://94923582044024,PetNew/Rank02/Egg50K_03_Verdantis,Tiny,true,1,0,277,277X,nil
87,Verdantis,3,rbxassetid://94923582044024,PetNew/Rank02/Egg50K_03_Verdantis_Mid,Normal,false,1,0,332.4,332.4X,nil
88,Verdantis,3,rbxassetid://94923582044024,PetNew/Rank02/Egg50K_03_Verdantis_Large,Large,false,1,0,415.5,415.5X,nil
89,Verdantis,3,rbxassetid://94923582044024,PetNew/Rank02/Egg50K_03_Verdantis,nil,false,1,0,1,1X,nil
90,Verdantis,3,rbxassetid://94923582044024,PetNew/Rank02/Egg50K_03_Verdantis,nil,false,1,0,1,1X,nil
91,Blightorn,4,rbxassetid://88119698339374,PetNew/Rank02/Egg50K_04_Blightorn,Tiny,true,1,0,320,320X,nil
92,Blightorn,4,rbxassetid://88119698339374,PetNew/Rank02/Egg50K_04_Blightorn_Mid,Normal,false,1,0,384,384X,nil
93,Blightorn,4,rbxassetid://88119698339374,PetNew/Rank02/Egg50K_04_Blightorn_Large,Large,false,1,0,480,480X,nil
94,Blightorn,4,rbxassetid://88119698339374,PetNew/Rank02/Egg50K_04_Blightorn,nil,false,1,0,1,1X,nil
95,Blightorn,4,rbxassetid://88119698339374,PetNew/Rank02/Egg50K_04_Blightorn,nil,false,1,0,1,1X,nil
96,Nexvoidra,5,rbxassetid://140355526560098,PetNew/Rank02/Egg50K_05_Nexvoidra,Tiny,true,1,0,400,400X,nil
97,Nexvoidra,5,rbxassetid://140355526560098,PetNew/Rank02/Egg50K_05_Nexvoidra_Mid,Normal,false,1,0,480,480X,nil
98,Nexvoidra,5,rbxassetid://140355526560098,PetNew/Rank02/Egg50K_05_Nexvoidra_Large,Large,false,1,0,600,600X,nil
99,Nexvoidra,5,rbxassetid://140355526560098,PetNew/Rank02/Egg50K_05_Nexvoidra,nil,false,1,0,1,1X,nil
100,Nexvoidra,5,rbxassetid://140355526560098,PetNew/Rank02/Egg50K_05_Nexvoidra,nil,false,1,0,1,1X,nil
101,Shadowbit,1,rbxassetid://91171164453882,PetNew/Rank02/200K01_Shadowbit,Tiny,true,2,0,600,600X,nil
102,Shadowbit,1,rbxassetid://91171164453882,PetNew/Rank02/200K01_Shadowbit_Mid,Normal,false,2,0,720,720X,nil
103,Shadowbit,1,rbxassetid://91171164453882,PetNew/Rank02/200K01_Shadowbit_Large,Large,false,2,0,900,900X,nil
104,Shadowbit,1,rbxassetid://91171164453882,PetNew/Rank02/200K01_Shadowbit,nil,false,2,0,1,1X,nil
105,Shadowbit,1,rbxassetid://91171164453882,PetNew/Rank02/200K01_Shadowbit,nil,false,2,0,1,1X,nil
106,Lumiboo,2,rbxassetid://100020820025175,PetNew/Rank02/200K02_Lumiboo,Tiny,true,2,0,650,650X,nil
107,Lumiboo,2,rbxassetid://100020820025175,PetNew/Rank02/200K02_Lumiboo_Mid,Normal,false,2,0,780,780X,nil
108,Lumiboo,2,rbxassetid://100020820025175,PetNew/Rank02/200K02_Lumiboo_Large,Large,false,2,0,975,975X,nil
109,Lumiboo,2,rbxassetid://100020820025175,PetNew/Rank02/200K02_Lumiboo,nil,false,2,0,1,1X,nil
110,Lumiboo,2,rbxassetid://100020820025175,PetNew/Rank02/200K02_Lumiboo,nil,false,2,0,1,1X,nil
111,Frosthalo,3,rbxassetid://93640291597129,PetNew/Rank02/200K03_Frosthalo,Tiny,true,2,0,710,710X,nil
112,Frosthalo,3,rbxassetid://93640291597129,PetNew/Rank02/200K03_Frosthalo_Mid,Normal,false,2,0,852,852X,nil
113,Frosthalo,3,rbxassetid://93640291597129,PetNew/Rank02/200K03_Frosthalo_Large,Large,false,2,0,1065,1065X,nil
114,Frosthalo,3,rbxassetid://93640291597129,PetNew/Rank02/200K03_Frosthalo,nil,false,2,0,1,1X,nil
115,Frosthalo,3,rbxassetid://93640291597129,PetNew/Rank02/200K03_Frosthalo,nil,false,2,0,1,1X,nil
116,Twinklepaw,4,rbxassetid://120136115496341,PetNew/Rank02/200K04_Twinklepaw,Tiny,true,2,0,780,780X,nil
117,Twinklepaw,4,rbxassetid://120136115496341,PetNew/Rank02/200K04_Twinklepaw_Mid,Normal,false,2,0,936,936X,nil
118,Twinklepaw,4,rbxassetid://120136115496341,PetNew/Rank02/200K04_Twinklepaw_Large,Large,false,2,0,1170,1170X,nil
119,Twinklepaw,4,rbxassetid://120136115496341,PetNew/Rank02/200K04_Twinklepaw,nil,false,2,0,1,1X,nil
120,Twinklepaw,4,rbxassetid://120136115496341,PetNew/Rank02/200K04_Twinklepaw,nil,false,2,0,1,1X,nil
121,Inferbibi,5,rbxassetid://91501088767499,PetNew/Rank02/200K05_Inferbibi,Tiny,true,2,0,880,880X,nil
122,Inferbibi,5,rbxassetid://91501088767499,PetNew/Rank02/200K05_Inferbibi_Mid,Normal,false,2,0,1056,1056X,nil
123,Inferbibi,5,rbxassetid://91501088767499,PetNew/Rank02/200K05_Inferbibi_Large,Large,false,2,0,1320,1320X,nil
124,Inferbibi,5,rbxassetid://91501088767499,PetNew/Rank02/200K05_Inferbibi,nil,false,2,0,1,1X,nil
125,Inferbibi,5,rbxassetid://91501088767499,PetNew/Rank02/200K05_Inferbibi,nil,false,2,0,1,1X,nil
126,Chipbot,1,rbxassetid://112954121159805,PetNew/Rank02/800K01_Chipbot,Tiny,true,2,0,1100,1100X,nil
127,Chipbot,1,rbxassetid://112954121159805,PetNew/Rank02/800K01_Chipbot_Mid,Normal,false,2,0,1320,1320X,nil
128,Chipbot,1,rbxassetid://112954121159805,PetNew/Rank02/800K01_Chipbot_Large,Large,false,2,0,1650,1650X,nil
129,Chipbot,1,rbxassetid://112954121159805,PetNew/Rank02/800K01_Chipbot,nil,false,2,0,1,1X,nil
130,Chipbot,1,rbxassetid://112954121159805,PetNew/Rank02/800K01_Chipbot,nil,false,2,0,1,1X,nil
131,Mystibot,2,rbxassetid://125525389819467,PetNew/Rank02/800K02_Mystibot,Tiny,true,2,0,1200,1200X,nil
132,Mystibot,2,rbxassetid://125525389819467,PetNew/Rank02/800K02_Mystibot_Mid,Normal,false,2,0,1440,1440X,nil
133,Mystibot,2,rbxassetid://125525389819467,PetNew/Rank02/800K02_Mystibot_Large,Large,false,2,0,1800,1800X,nil
134,Mystibot,2,rbxassetid://125525389819467,PetNew/Rank02/800K02_Mystibot,nil,false,2,0,1,1X,nil
135,Mystibot,2,rbxassetid://125525389819467,PetNew/Rank02/800K02_Mystibot,nil,false,2,0,1,1X,nil
136,Heartcore,3,rbxassetid://115293601949519,PetNew/Rank02/800K03_Heartcore,Tiny,true,2,0,1300,1300X,nil
137,Heartcore,3,rbxassetid://115293601949519,PetNew/Rank02/800K03_Heartcore_Mid,Normal,false,2,0,1560,1560X,nil
138,Heartcore,3,rbxassetid://115293601949519,PetNew/Rank02/800K03_Heartcore_Large,Large,false,2,0,1950,1950X,nil
139,Heartcore,3,rbxassetid://115293601949519,PetNew/Rank02/800K03_Heartcore,nil,false,2,0,1,1X,nil
140,Heartcore,3,rbxassetid://115293601949519,PetNew/Rank02/800K03_Heartcore,nil,false,2,0,1,1X,nil
141,Targetron,4,rbxassetid://100481257871322,PetNew/Rank02/800K04_Targetron,Tiny,true,2,0,1500,1500X,nil
142,Targetron,4,rbxassetid://100481257871322,PetNew/Rank02/800K04_Targetron_Mid,Normal,false,2,0,1800,1800X,nil
143,Targetron,4,rbxassetid://100481257871322,PetNew/Rank02/800K04_Targetron_Large,Large,false,2,0,2250,2250X,nil
144,Targetron,4,rbxassetid://100481257871322,PetNew/Rank02/800K04_Targetron,nil,false,2,0,1,1X,nil
145,Targetron,4,rbxassetid://100481257871322,PetNew/Rank02/800K04_Targetron,nil,false,2,0,1,1X,nil
146,Buzzy,5,rbxassetid://139499492939806,PetNew/Rank02/800K05_Buzzy,Tiny,true,2,0,1800,1800X,nil
147,Buzzy,5,rbxassetid://139499492939806,PetNew/Rank02/800K05_Buzzy_Mid,Normal,false,2,0,2160,2160X,nil
148,Buzzy,5,rbxassetid://139499492939806,PetNew/Rank02/800K05_Buzzy_Large,Large,false,2,0,2700,2700X,nil
149,Buzzy,5,rbxassetid://139499492939806,PetNew/Rank02/800K05_Buzzy,nil,false,2,0,1,1X,nil
150,Buzzy,5,rbxassetid://139499492939806,PetNew/Rank02/800K05_Buzzy,nil,false,2,0,1,1X,nil
151,Slimee,6,rbxassetid://110118864895973,PetNew/PetsRoblox/Rank01RB01_Slimee,Tiny,true,2,0,42,42X,ProductStorePet151
152,Slimee,6,rbxassetid://110118864895973,PetNew/PetsRoblox/Rank01RB01_Slimee_Mid,Normal,false,2,0,50.4,50.4X,nil
153,Slimee,6,rbxassetid://110118864895973,PetNew/PetsRoblox/Rank01RB01_Slimee_Large,Large,false,2,0,63,63X,nil
154,Slimee,6,rbxassetid://110118864895973,PetNew/PetsRoblox/Rank01RB01_Slimee,nil,false,2,0,1,1X,nil
155,Slimee,6,rbxassetid://110118864895973,PetNew/PetsRoblox/Rank01RB01_Slimee,nil,false,2,0,1,1X,nil
156,Bubbloo,6,rbxassetid://130923749805734,PetNew/PetsRoblox/Rank01RB02_Bubbloo,Tiny,true,2,0,170,170X,ProductStorePet156
157,Bubbloo,6,rbxassetid://130923749805734,PetNew/PetsRoblox/Rank01RB02_Bubbloo_Mid,Normal,false,2,0,204,204X,nil
158,Bubbloo,6,rbxassetid://130923749805734,PetNew/PetsRoblox/Rank01RB02_Bubbloo_Large,Large,false,2,0,255,255X,nil
159,Bubbloo,6,rbxassetid://130923749805734,PetNew/PetsRoblox/Rank01RB02_Bubbloo,nil,false,2,0,1,1X,nil
160,Bubbloo,6,rbxassetid://130923749805734,PetNew/PetsRoblox/Rank01RB02_Bubbloo,nil,false,2,0,1,1X,nil
161,Cherubee,6,rbxassetid://71445192977824,PetNew/PetsRoblox/Rank02RB03_Cherubee,Tiny,true,2,0,900,900X,ProductStorePet161
162,Cherubee,6,rbxassetid://71445192977824,PetNew/PetsRoblox/Rank02RB03_Cherubee_Mid,Normal,false,2,0,1080,1080X,nil
163,Cherubee,6,rbxassetid://71445192977824,PetNew/PetsRoblox/Rank02RB03_Cherubee_Large,Large,false,2,0,1350,1350X,nil
164,Cherubee,6,rbxassetid://71445192977824,PetNew/PetsRoblox/Rank02RB03_Cherubee,nil,false,2,0,1,1X,nil
165,Cherubee,6,rbxassetid://71445192977824,PetNew/PetsRoblox/Rank02RB03_Cherubee,nil,false,2,0,1,1X,nil
166,Mystiboo,6,rbxassetid://138070079030804,PetNew/PetsRoblox/Rank02RB04_Mystiboo,Tiny,true,2,0,2900,2900X,ProductStorePet166
167,Mystiboo,6,rbxassetid://138070079030804,PetNew/PetsRoblox/Rank02RB04_Mystiboo_Mid,Normal,false,2,0,3480,3480X,nil
168,Mystiboo,6,rbxassetid://138070079030804,PetNew/PetsRoblox/Rank02RB04_Mystiboo_Large,Large,false,2,0,4350,4350X,nil
169,Mystiboo,6,rbxassetid://138070079030804,PetNew/PetsRoblox/Rank02RB04_Mystiboo,nil,false,2,0,1,1X,nil
170,Mystiboo,6,rbxassetid://138070079030804,PetNew/PetsRoblox/Rank02RB04_Mystiboo,nil,false,2,0,1,1X,nil
171,Zapcube,6,rbxassetid://74750011108036,PetNew/PetsRoblox/Rank01RB05_Zapcube,Tiny,true,2,0,1,1X,nil
172,Zapcube,6,rbxassetid://74750011108036,PetNew/PetsRoblox/Rank01RB05_Zapcube_Mid,Normal,false,2,0,1,1X,nil
173,Zapcube,6,rbxassetid://74750011108036,PetNew/PetsRoblox/Rank01RB05_Zapcube_Large,Large,false,2,0,1,1X,nil
174,Zapcube,6,rbxassetid://74750011108036,PetNew/PetsRoblox/Rank01RB05_Zapcube,nil,false,2,0,1,1X,nil
175,Zapcube,6,rbxassetid://74750011108036,PetNew/PetsRoblox/Rank01RB05_Zapcube,nil,false,2,0,1,1X,nil
176,Cryostel,6,rbxassetid://98793576432233,PetNew/PetsRoblox/Rank01RB01_Slimee,Tiny,true,2,0,1,1X,nil
177,Cryostel,6,rbxassetid://98793576432233,PetNew/PetsRoblox/Rank01RB01_Slimee,Normal,false,2,0,1,1X,nil
178,Cryostel,6,rbxassetid://98793576432233,PetNew/PetsRoblox/Rank01RB01_Slimee,Large,false,2,0,1,1X,nil
179,Cryostel,6,rbxassetid://98793576432233,PetNew/PetsRoblox/Rank01RB01_Slimee,nil,false,2,0,1,1X,nil
180,Cryostel,6,rbxassetid://98793576432233,PetNew/PetsRoblox/Rank01RB01_Slimee,nil,false,2,0,1,1X,nil
181,Aethergem,6,rbxassetid://88351182574814,PetNew/PetsRoblox/Rank01RB01_Slimee,Tiny,true,2,0,1,1X,nil
182,Aethergem,6,rbxassetid://88351182574814,PetNew/PetsRoblox/Rank01RB01_Slimee,Normal,false,2,0,1,1X,nil
183,Aethergem,6,rbxassetid://88351182574814,PetNew/PetsRoblox/Rank01RB01_Slimee,Large,false,2,0,1,1X,nil
184,Aethergem,6,rbxassetid://88351182574814,PetNew/PetsRoblox/Rank01RB01_Slimee,nil,false,2,0,1,1X,nil
185,Aethergem,6,rbxassetid://88351182574814,PetNew/PetsRoblox/Rank01RB01_Slimee,nil,false,2,0,1,1X,nil
186,Luminova,6,rbxassetid://97958746390784,PetNew/PetsRoblox/Rank01RB01_Slimee,Tiny,true,2,0,1,1X,nil
187,Luminova,6,rbxassetid://97958746390784,PetNew/PetsRoblox/Rank01RB01_Slimee,Normal,false,2,0,1,1X,nil
188,Luminova,6,rbxassetid://97958746390784,PetNew/PetsRoblox/Rank01RB01_Slimee,Large,false,2,0,1,1X,nil
189,Luminova,6,rbxassetid://97958746390784,PetNew/PetsRoblox/Rank01RB01_Slimee,nil,false,2,0,1,1X,nil
190,Luminova,6,rbxassetid://97958746390784,PetNew/PetsRoblox/Rank01RB01_Slimee,nil,false,2,0,1,1X,nil
191,Pyrocore,6,rbxassetid://125673790407899,PetNew/PetsRoblox/Rank01RB01_Slimee,Tiny,true,2,0,1,1X,nil
192,Pyrocore,6,rbxassetid://125673790407899,PetNew/PetsRoblox/Rank01RB01_Slimee,Normal,false,2,0,1,1X,nil
193,Pyrocore,6,rbxassetid://125673790407899,PetNew/PetsRoblox/Rank01RB01_Slimee,Large,false,2,0,1,1X,nil
194,Pyrocore,6,rbxassetid://125673790407899,PetNew/PetsRoblox/Rank01RB01_Slimee,nil,false,2,0,1,1X,nil
195,Pyrocore,6,rbxassetid://125673790407899,PetNew/PetsRoblox/Rank01RB01_Slimee,nil,false,2,0,1,1X,nil
196,Voidion,6,rbxassetid://107423189403607,PetNew/PetsRoblox/Rank01RB01_Slimee,Tiny,true,2,0,1,1X,nil
197,Voidion,6,rbxassetid://107423189403607,PetNew/PetsRoblox/Rank01RB01_Slimee,Normal,false,2,0,1,1X,nil
198,Voidion,6,rbxassetid://107423189403607,PetNew/PetsRoblox/Rank01RB01_Slimee,Large,false,2,0,1,1X,nil
199,Voidion,6,rbxassetid://107423189403607,PetNew/PetsRoblox/Rank01RB01_Slimee,nil,false,2,0,1,1X,nil
200,Voidion,6,rbxassetid://107423189403607,PetNew/PetsRoblox/Rank01RB01_Slimee,nil,false,2,0,1,1X,nil
201,Infermo,6,rbxassetid://128833722760603,PetNew/PetsRoblox/Roblox01_Infermo,Tiny,true,4,0,1,1X,nil
202,Infermo,6,rbxassetid://128833722760603,PetNew/PetsRoblox/Roblox01_Infermo_Mid,Normal,false,4,0,1,1X,nil
203,Infermo,6,rbxassetid://128833722760603,PetNew/PetsRoblox/Roblox01_Infermo_Large,Large,false,4,0,1,1X,nil
204,Infermo,6,rbxassetid://128833722760603,PetNew/PetsRoblox/Roblox01_Infermo,nil,false,4,0,1,1X,nil
205,Infermo,6,rbxassetid://128833722760603,PetNew/PetsRoblox/Roblox01_Infermo,nil,false,4,0,1,1X,nil
206,Loveli,6,rbxassetid://82162367145565,PetNew/PetsRoblox/Roblox02_ Loveli,Tiny,true,4,0,1,1X,nil
207,Loveli,6,rbxassetid://82162367145565,PetNew/PetsRoblox/Roblox02_ Loveli_Mid,Normal,false,4,0,1,1X,nil
208,Loveli,6,rbxassetid://82162367145565,PetNew/PetsRoblox/Roblox02_ Loveli_Large,Large,false,4,0,1,1X,nil
209,Loveli,6,rbxassetid://82162367145565,PetNew/PetsRoblox/Roblox02_ Loveli,nil,false,4,0,1,1X,nil
210,Loveli,6,rbxassetid://82162367145565,PetNew/PetsRoblox/Roblox02_ Loveli,nil,false,4,0,1,1X,nil
211,HaloHex,5,rbxassetid://78390941572868,PetNew/PetsRoblox/Roblox03_HaloHex,Tiny,true,4,0,1,1X,nil
212,HaloHex,5,rbxassetid://78390941572868,PetNew/PetsRoblox/Roblox03_HaloHex_Mid,Normal,false,4,0,1,1X,nil
213,HaloHex,5,rbxassetid://78390941572868,PetNew/PetsRoblox/Roblox03_HaloHex_Large,Large,false,4,0,1,1X,nil
214,HaloHex,5,rbxassetid://78390941572868,PetNew/PetsRoblox/Roblox03_HaloHex,nil,false,4,0,1,1X,nil
215,HaloHex,5,rbxassetid://78390941572868,PetNew/PetsRoblox/Roblox03_HaloHex,nil,false,4,0,1,1X,nil
216,Frostbite,5,rbxassetid://100764664840612,PetNew/PetsRoblox/Roblox04_Frostbite,Tiny,true,4,0,1,1X,nil
217,Frostbite,5,rbxassetid://100764664840612,PetNew/PetsRoblox/Roblox04_Frostbite_Mid,Normal,false,4,0,1,1X,nil
218,Frostbite,5,rbxassetid://100764664840612,PetNew/PetsRoblox/Roblox04_Frostbite_Large,Large,false,4,0,1,1X,nil
219,Frostbite,5,rbxassetid://100764664840612,PetNew/PetsRoblox/Roblox04_Frostbite,nil,false,4,0,1,1X,nil
220,Frostbite,5,rbxassetid://100764664840612,PetNew/PetsRoblox/Roblox04_Frostbite,nil,false,4,0,1,1X,nil
221,Cardbox Demonling,4,rbxassetid://138951244810713,PetNew/SignPet/SignOnline01,Tiny,true,4,0,1,1X,nil
222,Cardbox Demonling,4,rbxassetid://138951244810713,PetNew/SignPet/SignOnline01_Mid,Normal,false,4,0,1,1X,nil
223,Cardbox Demonling,4,rbxassetid://138951244810713,PetNew/SignPet/SignOnline01_Large,Large,false,4,0,1,1X,nil
224,Cardbox Demonling,4,rbxassetid://138951244810713,PetNew/SignPet/SignOnline01,nil,false,4,0,1,1X,nil
225,Cardbox Demonling,4,rbxassetid://138951244810713,PetNew/SignPet/SignOnline01,nil,false,4,0,1,1X,nil
226,Stitched Demonkin,4,rbxassetid://112978571737998,PetNew/SignPet/SignOnline02,Tiny,true,4,0,1,1X,nil
227,Stitched Demonkin,4,rbxassetid://112978571737998,PetNew/SignPet/SignOnline02_Mid,Normal,false,4,0,1,1X,nil
228,Stitched Demonkin,4,rbxassetid://112978571737998,PetNew/SignPet/SignOnline02_Large,Large,false,4,0,1,1X,nil
229,Stitched Demonkin,4,rbxassetid://112978571737998,PetNew/SignPet/SignOnline02,nil,false,4,0,1,1X,nil
230,Stitched Demonkin,4,rbxassetid://112978571737998,PetNew/SignPet/SignOnline02,nil,false,4,0,1,1X,nil
231,Rainbowcorn,5,rbxassetid://121468072938857,PetNew/SignPet/SignOnline03,Tiny,true,4,0,1,1X,nil
232,Rainbowcorn,5,rbxassetid://121468072938857,PetNew/SignPet/SignOnline03_Mid,Normal,false,4,0,1,1X,nil
233,Rainbowcorn,5,rbxassetid://121468072938857,PetNew/SignPet/SignOnline03_Large,Large,false,4,0,1,1X,nil
234,Rainbowcorn,5,rbxassetid://121468072938857,PetNew/SignPet/SignOnline03,nil,false,4,0,1,1X,nil
235,Rainbowcorn,5,rbxassetid://121468072938857,PetNew/SignPet/SignOnline03,nil,false,4,0,1,1X,nil
236,Tinker Wyrmling,4,rbxassetid://121041467889399,PetNew/SignPet/Sign701,Tiny,true,4,0,1,1X,nil
237,Tinker Wyrmling,4,rbxassetid://121041467889399,PetNew/SignPet/Sign701_Mid,Normal,false,4,0,1,1X,nil
238,Tinker Wyrmling,4,rbxassetid://121041467889399,PetNew/SignPet/Sign701_Large,Large,false,4,0,1,1X,nil
239,Tinker Wyrmling,4,rbxassetid://121041467889399,PetNew/SignPet/Sign701,nil,false,4,0,1,1X,nil
240,Tinker Wyrmling,4,rbxassetid://121041467889399,PetNew/SignPet/Sign701,nil,false,4,0,1,1X,nil
241,Magic Queen,5,rbxassetid://118184927311617,PetNew/SignPet/Sign702,Tiny,true,4,0,1,1X,nil
242,Magic Queen,5,rbxassetid://118184927311617,PetNew/SignPet/Sign702_Mid,Normal,false,4,0,1,1X,nil
243,Magic Queen,5,rbxassetid://118184927311617,PetNew/SignPet/Sign702_Large,Large,false,4,0,1,1X,nil
244,Magic Queen,5,rbxassetid://118184927311617,PetNew/SignPet/Sign702,nil,false,4,0,1,1X,nil
245,Magic Queen,5,rbxassetid://118184927311617,PetNew/SignPet/Sign702,nil,false,4,0,1,1X,nil
246,Crimson,6,rbxassetid://130219904784080,PetNew/PetsRoblox/Newbie01,Tiny,true,4,2,1,200%,ProductStorePet246
247,Crimson,6,rbxassetid://130219904784080,PetNew/PetsRoblox/Newbie01_Mid,Normal,false,4,2.4,1,240%,nil
248,Crimson,6,rbxassetid://130219904784080,PetNew/PetsRoblox/Newbie01_Large,Large,false,4,3,1,300%,nil
249,Crimson,6,rbxassetid://130219904784080,PetNew/PetsRoblox/Newbie01,nil,false,4,0,1,1X,nil
250,Crimson,6,rbxassetid://130219904784080,PetNew/PetsRoblox/Newbie01,nil,false,4,0,1,1X,nil
251,Abyss,6,rbxassetid://80387007915967,PetNew/PetsRoblox/Newbie02,Tiny,true,4,3.2,1,320%,ProductStorePet251
252,Abyss,6,rbxassetid://80387007915967,PetNew/PetsRoblox/Newbie02_Mid,Normal,false,4,3.84,1,384%,nil
253,Abyss,6,rbxassetid://80387007915967,PetNew/PetsRoblox/Newbie02_Large,Large,false,4,4.8,1,480%,nil
254,Abyss,6,rbxassetid://80387007915967,PetNew/PetsRoblox/Newbie02,nil,false,4,0,1,1X,nil
255,Abyss,6,rbxassetid://80387007915967,PetNew/PetsRoblox/Newbie02,nil,false,4,0,1,1X,nil
256,Holywing,6,rbxassetid://96427321607903,PetNew/PetsRoblox/Newbie03,Tiny,true,4,4.5,1,450%,ProductStorePet256
257,Holywing,6,rbxassetid://96427321607903,PetNew/PetsRoblox/Newbie03_Mid,Normal,false,4,5.4,1,540%,nil
258,Holywing,6,rbxassetid://96427321607903,PetNew/PetsRoblox/Newbie03_Large,Large,false,4,6.75,1,675%,nil
259,Holywing,6,rbxassetid://96427321607903,PetNew/PetsRoblox/Newbie03,nil,false,4,0,1,1X,nil
260,Holywing,6,rbxassetid://96427321607903,PetNew/PetsRoblox/Newbie03,nil,false,4,0,1,1X,nil
261,Abyss,1,rbxassetid://89029589362419,PetNew/Rank03/52M01,Tiny,true,3,0,1,1X,nil
262,VerdantShard,1,rbxassetid://89029589362419,PetNew/Rank03/52M01_Mid,Normal,false,3,0,1,1X,nil
263,VerdantShard,1,rbxassetid://89029589362419,PetNew/Rank03/52M01_Large,Large,false,3,0,1,1X,nil
264,VerdantShard,1,rbxassetid://89029589362419,PetNew/Rank03/52M01,nil,false,3,0,1,1X,nil
265,VerdantShard,1,rbxassetid://89029589362419,PetNew/Rank03/52M01,nil,false,3,0,1,1X,nil
266,FrostShard,2,rbxassetid://103631935951917,PetNew/Rank03/52M02,Tiny,true,3,0,1,1X,nil
267,FrostShard,2,rbxassetid://103631935951917,PetNew/Rank03/52M02_Mid,Normal,false,3,0,1,1X,nil
268,FrostShard,2,rbxassetid://103631935951917,PetNew/Rank03/52M02_Large,Large,false,3,0,1,1X,nil
269,FrostShard,2,rbxassetid://103631935951917,PetNew/Rank03/52M02,nil,false,3,0,1,1X,nil
270,FrostShard,2,rbxassetid://103631935951917,PetNew/Rank03/52M02,nil,false,3,0,1,1X,nil
271,ArcaneShard,3,rbxassetid://81657116913258,PetNew/Rank03/52M03,Tiny,true,3,0,1,1X,nil
272,ArcaneShard,3,rbxassetid://81657116913258,PetNew/Rank03/52M03_Mid,Normal,false,3,0,1,1X,nil
273,ArcaneShard,3,rbxassetid://81657116913258,PetNew/Rank03/52M03_Large,Large,false,3,0,1,1X,nil
274,ArcaneShard,3,rbxassetid://81657116913258,PetNew/Rank03/52M03,nil,false,3,0,1,1X,nil
275,ArcaneShard,3,rbxassetid://81657116913258,PetNew/Rank03/52M03,nil,false,3,0,1,1X,nil
276,InfernoShard,4,rbxassetid://133150422484036,PetNew/Rank03/52M04,Tiny,true,3,0,1,1X,nil
277,InfernoShard,4,rbxassetid://133150422484036,PetNew/Rank03/52M04_Mid,Normal,false,3,0,1,1X,nil
278,InfernoShard,4,rbxassetid://133150422484036,PetNew/Rank03/52M04_Large,Large,false,3,0,1,1X,nil
279,InfernoShard,4,rbxassetid://133150422484036,PetNew/Rank03/52M04,nil,false,3,0,1,1X,nil
280,InfernoShard,4,rbxassetid://133150422484036,PetNew/Rank03/52M04,nil,false,3,0,1,1X,nil
281,VoidShard,4,rbxassetid://139639986153724,PetNew/Rank03/52M05,Tiny,true,3,0,1,1X,nil
282,VoidShard,4,rbxassetid://139639986153724,PetNew/Rank03/52M05_Mid,Normal,false,3,0,1,1X,nil
283,VoidShard,4,rbxassetid://139639986153724,PetNew/Rank03/52M05_Large,Large,false,3,0,1,1X,nil
284,VoidShard,4,rbxassetid://139639986153724,PetNew/Rank03/52M05,nil,false,3,0,1,1X,nil
285,VoidShard,4,rbxassetid://139639986153724,PetNew/Rank03/52M05,nil,false,3,0,1,1X,nil
286,NatureCore,1,rbxassetid://78483603362131,PetNew/Rank04/210M01,Tiny,true,3,0,1,1X,nil
287,NatureCore,1,rbxassetid://78483603362131,PetNew/Rank04/210M01_Mid,Normal,false,3,0,1,1X,nil
288,NatureCore,1,rbxassetid://78483603362131,PetNew/Rank04/210M01_Large,Large,false,3,0,1,1X,nil
289,NatureCore,1,rbxassetid://78483603362131,PetNew/Rank04/210M01,nil,false,3,0,1,1X,nil
290,NatureCore,1,rbxassetid://78483603362131,PetNew/Rank04/210M01,nil,false,3,0,1,1X,nil
291,ShadowCore,2,rbxassetid://107028468395283,PetNew/Rank04/210M02,Tiny,true,3,0,1,1X,nil
292,ShadowCore,2,rbxassetid://107028468395283,PetNew/Rank04/210M02_Mid,Normal,false,3,0,1,1X,nil
293,ShadowCore,2,rbxassetid://107028468395283,PetNew/Rank04/210M02_Large,Large,false,3,0,1,1X,nil
294,ShadowCore,2,rbxassetid://107028468395283,PetNew/Rank04/210M02,nil,false,3,0,1,1X,nil
295,ShadowCore,2,rbxassetid://107028468395283,PetNew/Rank04/210M02,nil,false,3,0,1,1X,nil
296,AngelCore,3,rbxassetid://77099667734453,PetNew/Rank04/210M03,Tiny,true,3,0,1,1X,nil
297,AngelCore,3,rbxassetid://77099667734453,PetNew/Rank04/210M03_Mid,Normal,false,3,0,1,1X,nil
298,AngelCore,3,rbxassetid://77099667734453,PetNew/Rank04/210M03_Large,Large,false,3,0,1,1X,nil
299,AngelCore,3,rbxassetid://77099667734453,PetNew/Rank04/210M03,nil,false,3,0,1,1X,nil
300,AngelCore,3,rbxassetid://77099667734453,PetNew/Rank04/210M03,nil,false,3,0,1,1X,nil
301,FlameCore,4,rbxassetid://96769369371376,PetNew/Rank04/210M04,Tiny,true,3,0,1,1X,nil
302,FlameCore,4,rbxassetid://96769369371376,PetNew/Rank04/210M04_Mid,Normal,false,3,0,1,1X,nil
303,FlameCore,4,rbxassetid://96769369371376,PetNew/Rank04/210M04_Large,Large,false,3,0,1,1X,nil
304,FlameCore,4,rbxassetid://96769369371376,PetNew/Rank04/210M04,nil,false,3,0,1,1X,nil
305,FlameCore,4,rbxassetid://96769369371376,PetNew/Rank04/210M04,nil,false,3,0,1,1X,nil
306,SunCore,4,rbxassetid://71619341682288,PetNew/Rank04/210M05,Tiny,true,3,0,1,1X,nil
307,SunCore,4,rbxassetid://71619341682288,PetNew/Rank04/210M05_Mid,Normal,false,3,0,1,1X,nil
308,SunCore,4,rbxassetid://71619341682288,PetNew/Rank04/210M05_Large,Large,false,3,0,1,1X,nil
309,SunCore,4,rbxassetid://71619341682288,PetNew/Rank04/210M05,nil,false,3,0,1,1X,nil
310,SunCore,4,rbxassetid://71619341682288,PetNew/Rank04/210M05,nil,false,3,0,1,1X,nil
311,SlimeBud,1,rbxassetid://120139927477903,PetNew/Rank04/840M01,Tiny,true,3,0,1,1X,nil
312,SlimeBud,1,rbxassetid://120139927477903,PetNew/Rank04/840M01_Mid,Normal,false,3,0,1,1X,nil
313,SlimeBud,1,rbxassetid://120139927477903,PetNew/Rank04/840M01_Large,Large,false,3,0,1,1X,nil
314,SlimeBud,1,rbxassetid://120139927477903,PetNew/Rank04/840M01,nil,false,3,0,1,1X,nil
315,SlimeBud,1,rbxassetid://120139927477903,PetNew/Rank04/840M01,nil,false,3,0,1,1X,nil
316,CrystalCrab,2,rbxassetid://81273924367666,PetNew/Rank04/840M02,Tiny,true,3,0,1,1X,nil
317,CrystalCrab,2,rbxassetid://81273924367666,PetNew/Rank04/840M02_Mid,Normal,false,3,0,1,1X,nil
318,CrystalCrab,2,rbxassetid://81273924367666,PetNew/Rank04/840M02_Large,Large,false,3,0,1,1X,nil
319,CrystalCrab,2,rbxassetid://81273924367666,PetNew/Rank04/840M02,nil,false,3,0,1,1X,nil
320,CrystalCrab,2,rbxassetid://81273924367666,PetNew/Rank04/840M02,nil,false,3,0,1,1X,nil
321,ArcaneClaw,3,rbxassetid://105493313037234,PetNew/Rank04/840M03,Tiny,true,3,0,1,1X,nil
322,ArcaneClaw,3,rbxassetid://105493313037234,PetNew/Rank04/840M03_Mid,Normal,false,3,0,1,1X,nil
323,ArcaneClaw,3,rbxassetid://105493313037234,PetNew/Rank04/840M03_Lare,Large,false,3,0,1,1X,nil
324,ArcaneClaw,3,rbxassetid://105493313037234,PetNew/Rank04/840M03,nil,false,3,0,1,1X,nil
325,ArcaneClaw,3,rbxassetid://105493313037234,PetNew/Rank04/840M03,nil,false,3,0,1,1X,nil
326,FlameBrute,4,rbxassetid://128186301865101,PetNew/Rank04/840M04,Tiny,true,3,0,1,1X,nil
327,FlameBrute,4,rbxassetid://128186301865101,PetNew/Rank04/840M04_Mid,Normal,false,3,0,1,1X,nil
328,FlameBrute,4,rbxassetid://128186301865101,PetNew/Rank04/840M04_Large,Large,false,3,0,1,1X,nil
329,FlameBrute,4,rbxassetid://128186301865101,PetNew/Rank04/840M04,nil,false,3,0,1,1X,nil
330,FlameBrute,4,rbxassetid://128186301865101,PetNew/Rank04/840M04,nil,false,3,0,1,1X,nil
331,SolarDominator,4,rbxassetid://132828270324812,PetNew/Rank04/840M05,Tiny,true,3,0,1,1X,nil
332,SolarDominator,4,rbxassetid://132828270324812,PetNew/Rank04/840M05_Mid,Normal,false,3,0,1,1X,nil
333,SolarDominator,4,rbxassetid://132828270324812,PetNew/Rank04/840M05_Large,Large,false,3,0,1,1X,nil
334,SolarDominator,4,rbxassetid://132828270324812,PetNew/Rank04/840M05,nil,false,3,0,1,1X,nil
335,SolarDominator,4,rbxassetid://132828270324812,PetNew/Rank04/840M05,nil,false,3,0,1,1X,nil
336,EmeraldGem,1,rbxassetid://99175632344236,PetNew/Rank04/3B01,Tiny,true,3,0,1,1X,nil
337,EmeraldGem,1,rbxassetid://99175632344236,PetNew/Rank04/3B01_Mid,Normal,false,3,0,1,1X,nil
338,EmeraldGem,1,rbxassetid://99175632344236,PetNew/Rank04/3B01_Large,Large,false,3,0,1,1X,nil
339,EmeraldGem,1,rbxassetid://99175632344236,PetNew/Rank04/3B01,nil,false,3,0,1,1X,nil
340,EmeraldGem,1,rbxassetid://99175632344236,PetNew/Rank04/3B01,nil,false,3,0,1,1X,nil
341,SapphireGem,2,rbxassetid://122403592627819,PetNew/Rank04/3B02,Tiny,true,3,0,1,1X,nil
342,SapphireGem,2,rbxassetid://122403592627819,PetNew/Rank04/3B02_Mid,Normal,false,3,0,1,1X,nil
343,SapphireGem,2,rbxassetid://122403592627819,PetNew/Rank04/3B02_Large,Large,false,3,0,1,1X,nil
344,SapphireGem,2,rbxassetid://122403592627819,PetNew/Rank04/3B02,nil,false,3,0,1,1X,nil
345,SapphireGem,2,rbxassetid://122403592627819,PetNew/Rank04/3B02,nil,false,3,0,1,1X,nil
346,Amethyst Crown,3,rbxassetid://111137937410636,PetNew/Rank04/3B03,Tiny,true,3,0,1,1X,nil
347,Amethyst Crown,3,rbxassetid://111137937410636,PetNew/Rank04/3B03_Mid,Normal,false,3,0,1,1X,nil
348,Amethyst Crown,3,rbxassetid://111137937410636,PetNew/Rank04/3B03_Large,Large,false,3,0,1,1X,nil
349,Amethyst Crown,3,rbxassetid://111137937410636,PetNew/Rank04/3B03,nil,false,3,0,1,1X,nil
350,Amethyst Crown,3,rbxassetid://111137937410636,PetNew/Rank04/3B03,nil,false,3,0,1,1X,nil
351,Ruby Wings,4,rbxassetid://87419362750249,PetNew/Rank04/3B04,Tiny,true,3,0,1,6X,nil
352,Ruby Wings,4,rbxassetid://87419362750249,PetNew/Rank04/3B04_Mid,Normal,false,3,0,1,7.2X,nil
353,Ruby Wings,4,rbxassetid://87419362750249,PetNew/Rank04/3B04_Large,Large,false,3,0,1,9X,nil
354,Ruby Wings,4,rbxassetid://87419362750249,PetNew/Rank04/3B04,nil,false,3,0,1,1X,nil
355,Ruby Wings,4,rbxassetid://87419362750249,PetNew/Rank04/3B04,nil,false,3,0,1,1X,nil
356,Golden Relic,4,rbxassetid://124374738935791,PetNew/Rank04/3B05,Tiny,true,3,0,1,1X,nil
357,Golden Relic,4,rbxassetid://124374738935791,PetNew/Rank04/3B05_Mid,Normal,false,3,0,1,1X,nil
358,Golden Relic,4,rbxassetid://124374738935791,PetNew/Rank04/3B05_Large,Large,false,3,0,1,1X,nil
359,Golden Relic,4,rbxassetid://124374738935791,PetNew/Rank04/3B05,nil,false,3,0,1,1X,nil
360,Golden Relic,4,rbxassetid://124374738935791,PetNew/Rank04/3B05,nil,false,3,0,1,1X,nil
361,Hipopotamo,5,rbxassetid://95979472459104,PetNew/PetsRoblox/Brainrot01,Tiny,true,4,0,50,50X,nil
362,Hipopotamo,5,rbxassetid://95979472459104,PetNew/PetsRoblox/Brainrot01_Mid,Normal,false,4,0,60,60X,nil
363,Hipopotamo,5,rbxassetid://95979472459104,PetNew/PetsRoblox/Brainrot01_Large,Large,false,4,0,75,75X,nil
364,Hipopotamo,5,rbxassetid://95979472459104,PetNew/PetsRoblox/Brainrot01,nil,false,4,0,1,1X,nil
365,Hipopotamo,5,rbxassetid://95979472459104,PetNew/PetsRoblox/Brainrot01,nil,false,4,0,1,1X,nil
366,Odin DinDin Dun,5,rbxassetid://94959290083015,PetNew/PetsRoblox/Brainrot03,Tiny,true,4,0,160,160X,nil
367,Odin DinDin Dun,5,rbxassetid://94959290083015,PetNew/PetsRoblox/Brainrot03_Mid,Normal,false,4,0,192,192X,nil
368,Odin DinDin Dun,5,rbxassetid://94959290083015,PetNew/PetsRoblox/Brainrot03_Large,Large,false,4,0,240,240X,nil
369,Odin DinDin Dun,5,rbxassetid://94959290083015,PetNew/PetsRoblox/Brainrot03,nil,false,4,0,1,1X,nil
370,Odin DinDin Dun,5,rbxassetid://94959290083015,PetNew/PetsRoblox/Brainrot03,nil,false,4,0,1,1X,nil
371,Chimpanzini Bananini,6,rbxassetid://100896048702275,PetNew/PetsRoblox/Brainrot04,Tiny,true,4,1,1,100%,nil
372,Chimpanzini Bananini,6,rbxassetid://100896048702275,PetNew/PetsRoblox/Brainrot04_Mid,Normal,false,4,1.2,1,120%,nil
373,Chimpanzini Bananini,6,rbxassetid://100896048702275,PetNew/PetsRoblox/Brainrot04_Large,Large,false,4,1.5,1,150%,nil
374,Chimpanzini Bananini,6,rbxassetid://100896048702275,PetNew/PetsRoblox/Brainrot04,nil,false,4,0,1,1X,nil
375,Chimpanzini Bananini,6,rbxassetid://100896048702275,PetNew/PetsRoblox/Brainrot04,nil,false,4,0,1,1X,nil
376,Tralalero Tralala,6,rbxassetid://130142716335793,PetNew/PetsRoblox/Brainrot05,Tiny,true,4,1.5,1,150%,nil
377,Tralalero Tralala,6,rbxassetid://130142716335793,PetNew/PetsRoblox/Brainrot05_Mid,Normal,false,4,1.8,1,180%,nil
378,Tralalero Tralala,6,rbxassetid://130142716335793,PetNew/PetsRoblox/Brainrot05_Large,Large,false,4,2.25,1,225%,nil
379,Tralalero Tralala,6,rbxassetid://130142716335793,PetNew/PetsRoblox/Brainrot05,nil,false,4,0,1,1X,nil
380,Tralalero Tralala,6,rbxassetid://130142716335793,PetNew/PetsRoblox/Brainrot05,nil,false,4,0,1,1X,nil
381,Ragekin,2,rbxassetid://107457012377726,PetNew/Season/Season01Pet01,Tiny,true,5,0,6,6X,nil
382,Ragekin,2,rbxassetid://107457012377726,PetNew/Season/Season01Pet01_Mid,Normal,false,5,0,7.2,7.2X,nil
383,Ragekin,2,rbxassetid://107457012377726,PetNew/Season/Season01Pet01_Large,Large,false,5,0,9,9X,nil
384,Ragekin,2,rbxassetid://107457012377726,PetNew/Season/Season01Pet01,nil,false,5,0,1,1X,nil
385,Ragekin,2,rbxassetid://107457012377726,PetNew/Season/Season01Pet01,nil,false,5,0,1,1X,nil
386,Blossom Wisp,3,rbxassetid://112122956502520,PetNew/Season/Season01Pet02,Tiny,true,5,0,6,6X,nil
387,Blossom Wisp,3,rbxassetid://112122956502520,PetNew/Season/Season01Pet02_Mid,Normal,false,5,0,7.2,7.2X,nil
388,Blossom Wisp,3,rbxassetid://112122956502520,PetNew/Season/Season01Pet02_Large,Large,false,5,0,9,9X,nil
389,Blossom Wisp,3,rbxassetid://112122956502520,PetNew/Season/Season01Pet02,nil,false,5,0,1,1X,nil
390,Blossom Wisp,3,rbxassetid://112122956502520,PetNew/Season/Season01Pet02,nil,false,5,0,1,1X,nil
391,Frostbite,4,rbxassetid://110869709499336,PetNew/Season/Season01Pet03,Tiny,true,5,0,6,6X,nil
392,Frostbite,4,rbxassetid://110869709499336,PetNew/Season/Season01Pet03_Mid,Normal,false,5,0,7.2,7.2X,nil
393,Frostbite,4,rbxassetid://110869709499336,PetNew/Season/Season01Pet03_Large,Large,false,5,0,9,9X,nil
394,Frostbite,4,rbxassetid://110869709499336,PetNew/Season/Season01Pet03,nil,false,5,0,1,1X,nil
395,Frostbite,4,rbxassetid://110869709499336,PetNew/Season/Season01Pet03,nil,false,5,0,1,1X,nil
396,Barrel Blitz,6,rbxassetid://134167782460094,PetNew/Season/Season01Pet04,Tiny,true,5,0,6,6X,nil
397,Barrel Blitz,6,rbxassetid://134167782460094,PetNew/Season/Season01Pet04_Mid,Normal,false,5,0,7.2,7.2X,nil
398,Barrel Blitz,6,rbxassetid://134167782460094,PetNew/Season/Season01Pet04_Large,Large,false,5,0,9,9X,nil
399,Barrel Blitz,6,rbxassetid://134167782460094,PetNew/Season/Season01Pet04,nil,false,5,0,1,1X,nil
400,Barrel Blitz,6,rbxassetid://134167782460094,PetNew/Season/Season01Pet04,nil,false,5,0,1,1X,nil
401,ToxiSkull,5,rbxassetid://125967433540956,PetNew/Season/Season01Pet05,Tiny,false,5,1.5,6,6X,nil
402,ToxiSkull,5,rbxassetid://125967433540956,PetNew/Season/Season01Pet05_Mid,Normal,false,5,2.25,7.2,7.2X,nil
403,ToxiSkull,5,rbxassetid://125967433540956,PetNew/Season/Season01Pet05_Large,Large,true,5,3,9,9X,nil
404,ToxiSkull,5,rbxassetid://125967433540956,PetNew/Season/Season01Pet05,nil,false,5,0,1,1X,nil
405,ToxiSkull,5,rbxassetid://125967433540956,PetNew/Season/Season01Pet05,nil,false,5,0,1,1X,nil
406,Frost Cub,3,rbxassetid://91005074061121,PetNew/Christmas/ChristmasPet01,Tiny,true,5,0,6,6X,nil
407,Frost Cub,3,rbxassetid://91005074061121,PetNew/Christmas/ChristmasPet01_Mid,Normal,false,5,0,7.2,7.2X,nil
408,Frost Cub,3,rbxassetid://91005074061121,PetNew/Christmas/ChristmasPet01_Large,Large,false,5,0,9,9X,nil
409,Frost Cub,3,rbxassetid://91005074061121,PetNew/Christmas/ChristmasPet01,nil,false,5,0,1,1X,nil
410,Frost Cub,3,rbxassetid://91005074061121,PetNew/Christmas/ChristmasPet01,nil,false,5,0,1,1X,nil
411,Pinky Waddle,4,rbxassetid://70465789424927,PetNew/Christmas/ChristmasPet02,Tiny,true,5,0,6,6X,nil
412,Pinky Waddle,4,rbxassetid://70465789424927,PetNew/Christmas/ChristmasPet02_Mid,Normal,false,5,0,7.2,7.2X,nil
413,Pinky Waddle,4,rbxassetid://70465789424927,PetNew/Christmas/ChristmasPet02_Large,Large,false,5,0,9,9X,nil
414,Pinky Waddle,4,rbxassetid://70465789424927,PetNew/Christmas/ChristmasPet02,nil,false,5,0,1,1X,nil
415,Pinky Waddle,4,rbxassetid://70465789424927,PetNew/Christmas/ChristmasPet02,nil,false,5,0,1,1X,nil
416,Flame Tail,6,rbxassetid://90057588146086,PetNew/Christmas/ChristmasPet03,Tiny,true,5,0,6,6X,nil
417,Flame Tail,6,rbxassetid://90057588146086,PetNew/Christmas/ChristmasPet03_Mid,Normal,false,5,0,7.2,7.2X,nil
418,Flame Tail,6,rbxassetid://90057588146086,PetNew/Christmas/ChristmasPet03_Large,Large,false,5,0,9,9X,nil
419,Flame Tail,6,rbxassetid://90057588146086,PetNew/Christmas/ChristmasPet03,nil,false,5,0,1,1X,nil
420,Flame Tail,6,rbxassetid://90057588146086,PetNew/Christmas/ChristmasPet03,nil,false,5,0,1,1X,nil
421,Sir Whisker,6,rbxassetid://88902898550793,PetNew/Christmas/ChristmasPet04,Tiny,true,5,0,6,6X,nil
422,Sir Whisker,6,rbxassetid://88902898550793,PetNew/Christmas/ChristmasPet04_Mid,Normal,false,5,0,7.2,7.2X,nil
423,Sir Whisker,6,rbxassetid://88902898550793,PetNew/Christmas/ChristmasPet04_Large,Large,false,5,0,9,9X,nil
424,Sir Whisker,6,rbxassetid://88902898550793,PetNew/Christmas/ChristmasPet04,nil,false,5,0,1,1X,nil
425,Sir Whisker,6,rbxassetid://88902898550793,PetNew/Christmas/ChristmasPet04,nil,false,5,0,1,1X,nil
426,Snowmelt,5,rbxassetid://84442185399942,PetNew/Christmas/ChristmasPet05,Tiny,false,5,1,6,6X,nil
427,Snowmelt,5,rbxassetid://84442185399942,PetNew/Christmas/ChristmasPet05_Mid,Normal,false,5,1.5,7.2,7.2X,nil
428,Snowmelt,5,rbxassetid://84442185399942,PetNew/Christmas/ChristmasPet05_Large,Large,true,5,2,9,9X,nil
429,Snowmelt,5,rbxassetid://84442185399942,PetNew/Christmas/ChristmasPet05,nil,false,5,0,1,1X,nil
430,Snowmelt,5,rbxassetid://84442185399942,PetNew/Christmas/ChristmasPet05,nil,false,5,0,1,1X,nil
]=]

return PetConfig
