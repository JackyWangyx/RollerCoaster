local PetConfig = {}

PetConfig.Data = [[
ID,Name,Rarity,Icon,Prefab,Size,Indexable,World,MaxExistPowerFactor,GetPowerFactor1,GetPowerFactor2,GetPowerFactor3,DisplayGetPowerFactor,ProductKey
1,Doggy,1,rbxassetid://86721141310393,PetNew/Level01/Egg20_01_Doggy,Tiny,True,1,0.0,1.1,0,0,1.1X,nil
2,Doggy,1,rbxassetid://86721141310393,PetNew/Level01/Egg20_01_Doggy_Mid,Normal,False,1,0.0,1.15,0,0,1.15X,nil
3,Doggy,1,rbxassetid://86721141310393,PetNew/Level01/Egg20_01_Doggy_Large,Large,False,1,0.0,1.2,0,0,1.2X,nil
4,Doggy,1,rbxassetid://86721141310393,PetNew/Level01/Egg20_01_Doggy,nil,False,1,0.0,1.0,0,0,1X,nil
5,Doggy,1,rbxassetid://86721141310393,PetNew/Level01/Egg20_01_Doggy,nil,False,1,0.0,1.0,0,0,1X,nil
6,Dino,2,rbxassetid://92374459990750,PetNew/Level01/Egg20_02_Dino,Tiny,True,1,0.0,2.0,0,0,2X,nil
7,Dino,2,rbxassetid://92374459990750,PetNew/Level01/Egg20_02_Dino_Mid,Normal,False,1,0.0,2.5,0,0,2.5X,nil
8,Dino,2,rbxassetid://92374459990750,PetNew/Level01/Egg20_02_Dino_Large,Large,False,1,0.0,3.0,0,0,3X,nil
9,Dino,2,rbxassetid://92374459990750,PetNew/Level01/Egg20_02_Dino,nil,False,1,0.0,1.0,0,0,1X,nil
10,Dino,2,rbxassetid://92374459990750,PetNew/Level01/Egg20_02_Dino,nil,False,1,0.0,1.0,0,0,1X,nil
11,Panda,3,rbxassetid://118920667823004,PetNew/Level01/Egg20_03_Panda,Tiny,True,1,0.0,3.2,0,0,3.2X,nil
12,Panda,3,rbxassetid://118920667823004,PetNew/Level01/Egg20_03_Panda_Mid,Normal,False,1,0.0,4.3,0,0,4.3X,nil
13,Panda,3,rbxassetid://118920667823004,PetNew/Level01/Egg20_03_Panda_Large,Large,False,1,0.0,5.39,0,0,5.39X,nil
14,Panda,3,rbxassetid://118920667823004,PetNew/Level01/Egg20_03_Panda,nil,False,1,0.0,1.0,0,0,1X,nil
15,Panda,3,rbxassetid://118920667823004,PetNew/Level01/Egg20_03_Panda,nil,False,1,0.0,1.0,0,0,1X,nil
16,Piggy,4,rbxassetid://127509215972299,PetNew/Level01/Egg20_04_Piggy,Tiny,True,1,0.0,6.5,0,0,6.5X,nil
17,Piggy,4,rbxassetid://127509215972299,PetNew/Level01/Egg20_04_Piggy_Mid,Normal,False,1,0.0,9.25,0,0,9.25X,nil
18,Piggy,4,rbxassetid://127509215972299,PetNew/Level01/Egg20_04_Piggy_Large,Large,False,1,0.0,11.97,0,0,11.97X,nil
19,Piggy,4,rbxassetid://127509215972299,PetNew/Level01/Egg20_04_Piggy,nil,False,1,0.0,1.0,0,0,1X,nil
20,Piggy,4,rbxassetid://127509215972299,PetNew/Level01/Egg20_04_Piggy,nil,False,1,0.0,1.0,0,0,1X,nil
21,Kitty,4,rbxassetid://133950983951104,PetNew/Level01/Egg20_05_Kitty,Tiny,True,1,0.0,10.5,0,0,10.5X,nil
22,Kitty,4,rbxassetid://133950983951104,PetNew/Level01/Egg20_05_Kitty_Mid,Normal,False,1,0.0,15.25,0,0,15.25X,nil
23,Kitty,4,rbxassetid://133950983951104,PetNew/Level01/Egg20_05_Kitty_Large,Large,False,1,0.0,19.95,0,0,19.95X,nil
24,Kitty,4,rbxassetid://133950983951104,PetNew/Level01/Egg20_05_Kitty,nil,False,1,0.0,1.0,0,0,1X,nil
25,Kitty,4,rbxassetid://133950983951104,PetNew/Level01/Egg20_05_Kitty,nil,False,1,0.0,1.0,0,0,1X,nil
26,Wolf,1,rbxassetid://125481752865893,PetNew/Level01/Egg250_01_Wolf,Tiny,True,1,0.0,5.2,0,0,5.2X,nil
27,Wolf,1,rbxassetid://125481752865893,PetNew/Level01/Egg250_01_Wolf_Mid,Normal,False,1,0.0,7.3,0,0,7.3X,nil
28,Wolf,1,rbxassetid://125481752865893,PetNew/Level01/Egg250_01_Wolf_Large,Large,False,1,0.0,9.38,0,0,9.38X,nil
29,Wolf,1,rbxassetid://125481752865893,PetNew/Level01/Egg250_01_Wolf,nil,False,1,0.0,1.0,0,0,1X,nil
30,Wolf,1,rbxassetid://125481752865893,PetNew/Level01/Egg250_01_Wolf,nil,False,1,0.0,1.0,0,0,1X,nil
31,Bear,2,rbxassetid://108398654343385,PetNew/Level01/Egg250_02_Bear,Tiny,True,1,0.0,6.3,0,0,6.3X,nil
32,Bear,2,rbxassetid://108398654343385,PetNew/Level01/Egg250_02_Bear_Mid,Normal,False,1,0.0,8.95,0,0,8.95X,nil
33,Bear,2,rbxassetid://108398654343385,PetNew/Level01/Egg250_02_Bear_Large,Large,False,1,0.0,11.57,0,0,11.57X,nil
34,Bear,2,rbxassetid://108398654343385,PetNew/Level01/Egg250_02_Bear,nil,False,1,0.0,1.0,0,0,1X,nil
35,Bear,2,rbxassetid://108398654343385,PetNew/Level01/Egg250_02_Bear,nil,False,1,0.0,1.0,0,0,1X,nil
36,Bunny,3,rbxassetid://112465102440206,PetNew/Level01/Egg250_03_Bunny,Tiny,True,1,0.0,7.8,0,0,7.8X,nil
37,Bunny,3,rbxassetid://112465102440206,PetNew/Level01/Egg250_03_Bunny_Mid,Normal,False,1,0.0,11.2,0,0,11.2X,nil
38,Bunny,3,rbxassetid://112465102440206,PetNew/Level01/Egg250_03_Bunny_Large,Large,False,1,0.0,14.57,0,0,14.57X,nil
39,Bunny,3,rbxassetid://112465102440206,PetNew/Level01/Egg250_03_Bunny,nil,False,1,0.0,1.0,0,0,1X,nil
40,Bunny,3,rbxassetid://112465102440206,PetNew/Level01/Egg250_03_Bunny,nil,False,1,0.0,1.0,0,0,1X,nil
41,Fox,4,rbxassetid://105059624130297,PetNew/Level01/Egg250_04_Fox,Tiny,True,1,0.0,10.5,0,0,10.5X,nil
42,Fox,4,rbxassetid://105059624130297,PetNew/Level01/Egg250_04_Fox_Mid,Normal,False,1,0.0,15.25,0,0,15.25X,nil
43,Fox,4,rbxassetid://105059624130297,PetNew/Level01/Egg250_04_Fox_Large,Large,False,1,0.0,19.95,0,0,19.95X,nil
44,Fox,4,rbxassetid://105059624130297,PetNew/Level01/Egg250_04_Fox,nil,False,1,0.0,1.0,0,0,1X,nil
45,Fox,4,rbxassetid://105059624130297,PetNew/Level01/Egg250_04_Fox,nil,False,1,0.0,1.0,0,0,1X,nil
46,Deer,4,rbxassetid://119658014755716,PetNew/Level01/Egg250_05_Deer,Tiny,True,1,0.0,14.3,0,0,14.3X,nil
47,Deer,4,rbxassetid://119658014755716,PetNew/Level01/Egg250_05_Deer_Mid,Normal,False,1,0.0,20.95,0,0,20.95X,nil
48,Deer,4,rbxassetid://119658014755716,PetNew/Level01/Egg250_05_Deer_Large,Large,False,1,0.0,27.53,0,0,27.53X,nil
49,Deer,4,rbxassetid://119658014755716,PetNew/Level01/Egg250_05_Deer,nil,False,1,0.0,1.0,0,0,1X,nil
50,Deer,4,rbxassetid://119658014755716,PetNew/Level01/Egg250_05_Deer,nil,False,1,0.0,1.0,0,0,1X,nil
51,Voltiki,1,rbxassetid://118243793683813,PetNew/Level01/Egg3K_01_Voltiki,Tiny,True,1,0.0,8.5,0,0,8.5X,nil
52,Voltiki,1,rbxassetid://118243793683813,PetNew/Level01/Egg3K_01_Voltiki_Mid,Normal,False,1,0.0,12.25,0,0,12.25X,nil
53,Voltiki,1,rbxassetid://118243793683813,PetNew/Level01/Egg3K_01_Voltiki_Large,Large,False,1,0.0,15.96,0,0,15.96X,nil
54,Voltiki,1,rbxassetid://118243793683813,PetNew/Level01/Egg3K_01_Voltiki,nil,False,1,0.0,1.0,0,0,1X,nil
55,Voltiki,1,rbxassetid://118243793683813,PetNew/Level01/Egg3K_01_Voltiki,nil,False,1,0.0,1.0,0,0,1X,nil
56,Spiketra,2,rbxassetid://95230667974761,PetNew/Level01/Egg3K_02_Spiketra,Tiny,True,1,0.0,9.8,0,0,9.8X,nil
57,Spiketra,2,rbxassetid://95230667974761,PetNew/Level01/Egg3K_02_Spiketra_Mid,Normal,False,1,0.0,14.2,0,0,14.2X,nil
58,Spiketra,2,rbxassetid://95230667974761,PetNew/Level01/Egg3K_02_Spiketra_Large,Large,False,1,0.0,18.56,0,0,18.56X,nil
59,Spiketra,2,rbxassetid://95230667974761,PetNew/Level01/Egg3K_02_Spiketra,nil,False,1,0.0,1.0,0,0,1X,nil
60,Spiketra,2,rbxassetid://95230667974761,PetNew/Level01/Egg3K_02_Spiketra,nil,False,1,0.0,1.0,0,0,1X,nil
61,Frozbite,3,rbxassetid://121954968563489,PetNew/Level01/Egg3K_03_Frozbite,Tiny,True,1,0.0,11.5,0,0,11.5X,nil
62,Frozbite,3,rbxassetid://121954968563489,PetNew/Level01/Egg3K_03_Frozbite_Mid,Normal,False,1,0.0,16.75,0,0,16.75X,nil
63,Frozbite,3,rbxassetid://121954968563489,PetNew/Level01/Egg3K_03_Frozbite_Large,Large,False,1,0.0,21.95,0,0,21.95X,nil
64,Frozbite,3,rbxassetid://121954968563489,PetNew/Level01/Egg3K_03_Frozbite,nil,False,1,0.0,1.0,0,0,1X,nil
65,Frozbite,3,rbxassetid://121954968563489,PetNew/Level01/Egg3K_03_Frozbite,nil,False,1,0.0,1.0,0,0,1X,nil
66,Halochi,4,rbxassetid://75914773369312,PetNew/Level01/Egg3K_04_Halochi,Tiny,True,1,0.0,15.3,0,0,15.3X,nil
67,Halochi,4,rbxassetid://75914773369312,PetNew/Level01/Egg3K_04_Halochi_Mid,Normal,False,1,0.0,22.45,0,0,22.45X,nil
68,Halochi,4,rbxassetid://75914773369312,PetNew/Level01/Egg3K_04_Halochi_Large,Large,False,1,0.0,29.53,0,0,29.53X,nil
69,Halochi,4,rbxassetid://75914773369312,PetNew/Level01/Egg3K_04_Halochi,nil,False,1,0.0,1.0,0,0,1X,nil
70,Halochi,4,rbxassetid://75914773369312,PetNew/Level01/Egg3K_04_Halochi,nil,False,1,0.0,1.0,0,0,1X,nil
71,Noctobrax,4,rbxassetid://86999268036361,PetNew/Level01/Egg3K_05_Noctobrax,Tiny,True,1,0.0,19.1,0,0,19.1X,nil
72,Noctobrax,4,rbxassetid://86999268036361,PetNew/Level01/Egg3K_05_Noctobrax_Mid,Normal,False,1,0.0,28.15,0,0,28.15X,nil
73,Noctobrax,4,rbxassetid://86999268036361,PetNew/Level01/Egg3K_05_Noctobrax_Large,Large,False,1,0.0,37.11,0,0,37.11X,nil
74,Noctobrax,4,rbxassetid://86999268036361,PetNew/Level01/Egg3K_05_Noctobrax,nil,False,1,0.0,1.0,0,0,1X,nil
75,Noctobrax,4,rbxassetid://86999268036361,PetNew/Level01/Egg3K_05_Noctobrax,nil,False,1,0.0,1.0,0,0,1X,nil
76,Solureon,1,rbxassetid://118876479023519,PetNew/Level01/Egg50K_01_Solureon,Tiny,True,1,0.0,12.8,0,0,12.8X,nil
77,Solureon,1,rbxassetid://118876479023519,PetNew/Level01/Egg50K_01_Solureon_Mid,Normal,False,1,0.0,18.7,0,0,18.7X,nil
78,Solureon,1,rbxassetid://118876479023519,PetNew/Level01/Egg50K_01_Solureon_Large,Large,False,1,0.0,24.54,0,0,24.54X,nil
79,Solureon,1,rbxassetid://118876479023519,PetNew/Level01/Egg50K_01_Solureon,nil,False,1,0.0,1.0,0,0,1X,nil
80,Solureon,1,rbxassetid://118876479023519,PetNew/Level01/Egg50K_01_Solureon,nil,False,1,0.0,1.0,0,0,1X,nil
81,Glaciarch,2,rbxassetid://101579878256245,PetNew/Level01/Egg50K_02_Glaciarch,Tiny,True,1,0.0,13.5,0,0,13.5X,nil
82,Glaciarch,2,rbxassetid://101579878256245,PetNew/Level01/Egg50K_02_Glaciarch_Mid,Normal,False,1,0.0,19.75,0,0,19.75X,nil
83,Glaciarch,2,rbxassetid://101579878256245,PetNew/Level01/Egg50K_02_Glaciarch_Large,Large,False,1,0.0,25.94,0,0,25.94X,nil
84,Glaciarch,2,rbxassetid://101579878256245,PetNew/Level01/Egg50K_02_Glaciarch,nil,False,1,0.0,1.0,0,0,1X,nil
85,Glaciarch,2,rbxassetid://101579878256245,PetNew/Level01/Egg50K_02_Glaciarch,nil,False,1,0.0,1.0,0,0,1X,nil
86,Verdantis,3,rbxassetid://94923582044024,PetNew/Level01/Egg50K_03_Verdantis,Tiny,True,1,0.0,15.5,0,0,15.5X,nil
87,Verdantis,3,rbxassetid://94923582044024,PetNew/Level01/Egg50K_03_Verdantis_Mid,Normal,False,1,0.0,22.75,0,0,22.75X,nil
88,Verdantis,3,rbxassetid://94923582044024,PetNew/Level01/Egg50K_03_Verdantis_Large,Large,False,1,0.0,29.93,0,0,29.93X,nil
89,Verdantis,3,rbxassetid://94923582044024,PetNew/Level01/Egg50K_03_Verdantis,nil,False,1,0.0,1.0,0,0,1X,nil
90,Verdantis,3,rbxassetid://94923582044024,PetNew/Level01/Egg50K_03_Verdantis,nil,False,1,0.0,1.0,0,0,1X,nil
91,Blightorn,4,rbxassetid://88119698339374,PetNew/Level01/Egg50K_04_Blightorn,Tiny,True,1,0.0,18.5,0,0,18.5X,nil
92,Blightorn,4,rbxassetid://88119698339374,PetNew/Level01/Egg50K_04_Blightorn_Mid,Normal,False,1,0.0,27.25,0,0,27.25X,nil
93,Blightorn,4,rbxassetid://88119698339374,PetNew/Level01/Egg50K_04_Blightorn_Large,Large,False,1,0.0,35.91,0,0,35.91X,nil
94,Blightorn,4,rbxassetid://88119698339374,PetNew/Level01/Egg50K_04_Blightorn,nil,False,1,0.0,1.0,0,0,1X,nil
95,Blightorn,4,rbxassetid://88119698339374,PetNew/Level01/Egg50K_04_Blightorn,nil,False,1,0.0,1.0,0,0,1X,nil
96,Nexvoidra,4,rbxassetid://140355526560098,PetNew/Level01/Egg50K_05_Nexvoidra,Tiny,True,1,0.0,22.0,0,0,22X,nil
97,Nexvoidra,4,rbxassetid://140355526560098,PetNew/Level01/Egg50K_05_Nexvoidra_Mid,Normal,False,1,0.0,32.5,0,0,32.5X,nil
98,Nexvoidra,4,rbxassetid://140355526560098,PetNew/Level01/Egg50K_05_Nexvoidra_Large,Large,False,1,0.0,42.9,0,0,42.9X,nil
99,Nexvoidra,4,rbxassetid://140355526560098,PetNew/Level01/Egg50K_05_Nexvoidra,nil,False,1,0.0,1.0,0,0,1X,nil
100,Nexvoidra,4,rbxassetid://140355526560098,PetNew/Level01/Egg50K_05_Nexvoidra,nil,False,1,0.0,1.0,0,0,1X,nil
101,Shadowbit,1,rbxassetid://91171164453882,PetNew/Level02/200K01_Shadowbit,Tiny,True,2,0.0,17.0,0,0,17X,nil
102,Shadowbit,1,rbxassetid://91171164453882,PetNew/Level02/200K01_Shadowbit_Mid,Normal,False,2,0.0,25.0,0,0,25X,nil
103,Shadowbit,1,rbxassetid://91171164453882,PetNew/Level02/200K01_Shadowbit_Large,Large,False,2,0.0,32.92,0,0,32.92X,nil
104,Shadowbit,1,rbxassetid://91171164453882,PetNew/Level02/200K01_Shadowbit,nil,False,2,0.0,1.0,0,0,1X,nil
105,Shadowbit,1,rbxassetid://91171164453882,PetNew/Level02/200K01_Shadowbit,nil,False,2,0.0,1.0,0,0,1X,nil
106,Lumiboo,2,rbxassetid://100020820025175,PetNew/Level02/200K02_Lumiboo,Tiny,True,2,0.0,18.0,0,0,18X,nil
107,Lumiboo,2,rbxassetid://100020820025175,PetNew/Level02/200K02_Lumiboo_Mid,Normal,False,2,0.0,26.5,0,0,26.5X,nil
108,Lumiboo,2,rbxassetid://100020820025175,PetNew/Level02/200K02_Lumiboo_Large,Large,False,2,0.0,34.92,0,0,34.92X,nil
109,Lumiboo,2,rbxassetid://100020820025175,PetNew/Level02/200K02_Lumiboo,nil,False,2,0.0,1.0,0,0,1X,nil
110,Lumiboo,2,rbxassetid://100020820025175,PetNew/Level02/200K02_Lumiboo,nil,False,2,0.0,1.0,0,0,1X,nil
111,Frosthalo,3,rbxassetid://93640291597129,PetNew/Level02/200K03_Frosthalo,Tiny,True,2,0.0,19.3,0,0,19.3X,nil
112,Frosthalo,3,rbxassetid://93640291597129,PetNew/Level02/200K03_Frosthalo_Mid,Normal,False,2,0.0,28.45,0,0,28.45X,nil
113,Frosthalo,3,rbxassetid://93640291597129,PetNew/Level02/200K03_Frosthalo_Large,Large,False,2,0.0,37.51,0,0,37.51X,nil
114,Frosthalo,3,rbxassetid://93640291597129,PetNew/Level02/200K03_Frosthalo,nil,False,2,0.0,1.0,0,0,1X,nil
115,Frosthalo,3,rbxassetid://93640291597129,PetNew/Level02/200K03_Frosthalo,nil,False,2,0.0,1.0,0,0,1X,nil
116,Twinklepaw,4,rbxassetid://120136115496341,PetNew/Level02/200K04_Twinklepaw,Tiny,True,2,0.0,22.2,0,0,22.2X,nil
117,Twinklepaw,4,rbxassetid://120136115496341,PetNew/Level02/200K04_Twinklepaw_Mid,Normal,False,2,0.0,32.8,0,0,32.8X,nil
118,Twinklepaw,4,rbxassetid://120136115496341,PetNew/Level02/200K04_Twinklepaw_Large,Large,False,2,0.0,43.29,0,0,43.29X,nil
119,Twinklepaw,4,rbxassetid://120136115496341,PetNew/Level02/200K04_Twinklepaw,nil,False,2,0.0,1.0,0,0,1X,nil
120,Twinklepaw,4,rbxassetid://120136115496341,PetNew/Level02/200K04_Twinklepaw,nil,False,2,0.0,1.0,0,0,1X,nil
121,Inferbibi,4,rbxassetid://91501088767499,PetNew/Level02/200K05_Inferbibi,Tiny,True,2,0.0,26.1,0,0,26.1X,nil
122,Inferbibi,4,rbxassetid://91501088767499,PetNew/Level02/200K05_Inferbibi_Mid,Normal,False,2,0.0,38.65,0,0,38.65X,nil
123,Inferbibi,4,rbxassetid://91501088767499,PetNew/Level02/200K05_Inferbibi_Large,Large,False,2,0.0,51.07,0,0,51.07X,nil
124,Inferbibi,4,rbxassetid://91501088767499,PetNew/Level02/200K05_Inferbibi,nil,False,2,0.0,1.0,0,0,1X,nil
125,Inferbibi,4,rbxassetid://91501088767499,PetNew/Level02/200K05_Inferbibi,nil,False,2,0.0,1.0,0,0,1X,nil
126,Chipbot,1,rbxassetid://112954121159805,PetNew/Level02/800K01_Chipbot,Tiny,True,2,0.0,19.5,0,0,19.5X,nil
127,Chipbot,1,rbxassetid://112954121159805,PetNew/Level02/800K01_Chipbot_Mid,Normal,False,2,0.0,28.75,0,0,28.75X,nil
128,Chipbot,1,rbxassetid://112954121159805,PetNew/Level02/800K01_Chipbot_Large,Large,False,2,0.0,37.91,0,0,37.91X,nil
129,Chipbot,1,rbxassetid://112954121159805,PetNew/Level02/800K01_Chipbot,nil,False,2,0.0,1.0,0,0,1X,nil
130,Chipbot,1,rbxassetid://112954121159805,PetNew/Level02/800K01_Chipbot,nil,False,2,0.0,1.0,0,0,1X,nil
131,Mystibot,2,rbxassetid://125525389819467,PetNew/Level02/800K02_Mystibot,Tiny,True,2,0.0,20.5,0,0,20.5X,nil
132,Mystibot,2,rbxassetid://125525389819467,PetNew/Level02/800K02_Mystibot_Mid,Normal,False,2,0.0,30.25,0,0,30.25X,nil
133,Mystibot,2,rbxassetid://125525389819467,PetNew/Level02/800K02_Mystibot_Large,Large,False,2,0.0,39.9,0,0,39.9X,nil
134,Mystibot,2,rbxassetid://125525389819467,PetNew/Level02/800K02_Mystibot,nil,False,2,0.0,1.0,0,0,1X,nil
135,Mystibot,2,rbxassetid://125525389819467,PetNew/Level02/800K02_Mystibot,nil,False,2,0.0,1.0,0,0,1X,nil
136,Heartcore,3,rbxassetid://115293601949519,PetNew/Level02/800K03_Heartcore,Tiny,True,2,0.0,21.8,0,0,21.8X,nil
137,Heartcore,3,rbxassetid://115293601949519,PetNew/Level02/800K03_Heartcore_Mid,Normal,False,2,0.0,32.2,0,0,32.2X,nil
138,Heartcore,3,rbxassetid://115293601949519,PetNew/Level02/800K03_Heartcore_Large,Large,False,2,0.0,42.5,0,0,42.5X,nil
139,Heartcore,3,rbxassetid://115293601949519,PetNew/Level02/800K03_Heartcore,nil,False,2,0.0,1.0,0,0,1X,nil
140,Heartcore,3,rbxassetid://115293601949519,PetNew/Level02/800K03_Heartcore,nil,False,2,0.0,1.0,0,0,1X,nil
141,Targetron,4,rbxassetid://100481257871322,PetNew/Level02/800K04_Targetron,Tiny,True,2,0.0,24.8,0,0,24.8X,nil
142,Targetron,4,rbxassetid://100481257871322,PetNew/Level02/800K04_Targetron_Mid,Normal,False,2,0.0,36.7,0,0,36.7X,nil
143,Targetron,4,rbxassetid://100481257871322,PetNew/Level02/800K04_Targetron_Large,Large,False,2,0.0,48.48,0,0,48.48X,nil
144,Targetron,4,rbxassetid://100481257871322,PetNew/Level02/800K04_Targetron,nil,False,2,0.0,1.0,0,0,1X,nil
145,Targetron,4,rbxassetid://100481257871322,PetNew/Level02/800K04_Targetron,nil,False,2,0.0,1.0,0,0,1X,nil
146,Buzzy,4,rbxassetid://139499492939806,PetNew/Level02/800K05_Buzzy,Tiny,True,2,0.0,29.0,0,0,29X,nil
147,Buzzy,4,rbxassetid://139499492939806,PetNew/Level02/800K05_Buzzy_Mid,Normal,False,2,0.0,43.0,0,0,43X,nil
148,Buzzy,4,rbxassetid://139499492939806,PetNew/Level02/800K05_Buzzy_Large,Large,False,2,0.0,56.86,0,0,56.86X,nil
149,Buzzy,4,rbxassetid://139499492939806,PetNew/Level02/800K05_Buzzy,nil,False,2,0.0,1.0,0,0,1X,nil
150,Buzzy,4,rbxassetid://139499492939806,PetNew/Level02/800K05_Buzzy,nil,False,2,0.0,1.0,0,0,1X,nil
151,Slimee,1,rbxassetid://110118864895973,PetNew/Level02/3M01_Slimee,Tiny,True,2,0.0,22.0,0,0,22X,nil
152,Slimee,1,rbxassetid://110118864895973,PetNew/Level02/3M01_Slimee_Mid,Normal,False,2,0.0,32.5,0,0,32.5X,nil
153,Slimee,1,rbxassetid://110118864895973,PetNew/Level02/3M01_Slimee_Large,Large,False,2,0.0,42.9,0,0,42.9X,nil
154,Slimee,1,rbxassetid://110118864895973,PetNew/Level02/3M01_Slimee,nil,False,2,0.0,1.0,0,0,1X,nil
155,Slimee,1,rbxassetid://110118864895973,PetNew/Level02/3M01_Slimee,nil,False,2,0.0,1.0,0,0,1X,nil
156,Bubbloo,2,rbxassetid://130923749805734,PetNew/Level02/3M02_Bubbloo,Tiny,True,2,0.0,23.0,0,0,23X,nil
157,Bubbloo,2,rbxassetid://130923749805734,PetNew/Level02/3M02_Bubbloo_Mid,Normal,False,2,0.0,34.0,0,0,34X,nil
158,Bubbloo,2,rbxassetid://130923749805734,PetNew/Level02/3M02_Bubbloo_Large,Large,False,2,0.0,44.89,0,0,44.89X,nil
159,Bubbloo,2,rbxassetid://130923749805734,PetNew/Level02/3M02_Bubbloo,nil,False,2,0.0,1.0,0,0,1X,nil
160,Bubbloo,2,rbxassetid://130923749805734,PetNew/Level02/3M02_Bubbloo,nil,False,2,0.0,1.0,0,0,1X,nil
161,Cherubee,3,rbxassetid://71445192977824,PetNew/Level02/3M03_ Cherubee,Tiny,True,2,0.0,24.5,0,0,24.5X,nil
162,Cherubee,3,rbxassetid://71445192977824,PetNew/Level02/3M03_ Cherubee_Mid,Normal,False,2,0.0,36.25,0,0,36.25X,nil
163,Cherubee,3,rbxassetid://71445192977824,PetNew/Level02/3M03_ Cherubee_Large,Large,False,2,0.0,47.88,0,0,47.88X,nil
164,Cherubee,3,rbxassetid://71445192977824,PetNew/Level02/3M03_ Cherubee,nil,False,2,0.0,1.0,0,0,1X,nil
165,Cherubee,3,rbxassetid://71445192977824,PetNew/Level02/3M03_ Cherubee,nil,False,2,0.0,1.0,0,0,1X,nil
166,Mystiboo,4,rbxassetid://138070079030804,PetNew/Level02/3M04_Mystiboo,Tiny,True,2,0.0,27.8,0,0,27.8X,nil
167,Mystiboo,4,rbxassetid://138070079030804,PetNew/Level02/3M04_Mystiboo_Mid,Normal,False,2,0.0,41.2,0,0,41.2X,nil
168,Mystiboo,4,rbxassetid://138070079030804,PetNew/Level02/3M04_Mystiboo_Large,Large,False,2,0.0,54.47,0,0,54.47X,nil
169,Mystiboo,4,rbxassetid://138070079030804,PetNew/Level02/3M04_Mystiboo,nil,False,2,0.0,1.0,0,0,1X,nil
170,Mystiboo,4,rbxassetid://138070079030804,PetNew/Level02/3M04_Mystiboo,nil,False,2,0.0,1.0,0,0,1X,nil
171,Zapcube,4,rbxassetid://74750011108036,PetNew/Level02/3M05_Zapcube,Tiny,True,2,0.0,31.8,0,0,31.8X,nil
172,Zapcube,4,rbxassetid://74750011108036,PetNew/Level02/3M05_Zapcube_Mid,Normal,False,2,0.0,47.2,0,0,47.2X,nil
173,Zapcube,4,rbxassetid://74750011108036,PetNew/Level02/3M05_Zapcube_Large,Large,False,2,0.0,62.45,0,0,62.45X,nil
174,Zapcube,4,rbxassetid://74750011108036,PetNew/Level02/3M05_Zapcube,nil,False,2,0.0,1.0,0,0,1X,nil
175,Zapcube,4,rbxassetid://74750011108036,PetNew/Level02/3M05_Zapcube,nil,False,2,0.0,1.0,0,0,1X,nil
176,Cryostel,1,rbxassetid://98793576432233,PetNew/Level02/12M01_Cryostel,Tiny,True,2,0.0,24.8,0,0,24.8X,nil
177,Cryostel,1,rbxassetid://98793576432233,PetNew/Level02/12M01_Cryostel_Mid,Normal,False,2,0.0,36.7,0,0,36.7X,nil
178,Cryostel,1,rbxassetid://98793576432233,PetNew/Level02/12M01_Cryostel_Large,Large,False,2,0.0,48.48,0,0,48.48X,nil
179,Cryostel,1,rbxassetid://98793576432233,PetNew/Level02/12M01_Cryostel,nil,False,2,0.0,1.0,0,0,1X,nil
180,Cryostel,1,rbxassetid://98793576432233,PetNew/Level02/12M01_Cryostel,nil,False,2,0.0,1.0,0,0,1X,nil
181,Aethergem,2,rbxassetid://88351182574814,PetNew/Level02/12M02_Aethergem,Tiny,True,2,0.0,25.8,0,0,25.8X,nil
182,Aethergem,2,rbxassetid://88351182574814,PetNew/Level02/12M02_Aethergem_Mid,Normal,False,2,0.0,38.2,0,0,38.2X,nil
183,Aethergem,2,rbxassetid://88351182574814,PetNew/Level02/12M02_Aethergem_Large,Large,False,2,0.0,50.48,0,0,50.48X,nil
184,Aethergem,2,rbxassetid://88351182574814,PetNew/Level02/12M02_Aethergem,nil,False,2,0.0,1.0,0,0,1X,nil
185,Aethergem,2,rbxassetid://88351182574814,PetNew/Level02/12M02_Aethergem,nil,False,2,0.0,1.0,0,0,1X,nil
186,Luminova,3,rbxassetid://97958746390784,PetNew/Level02/12M03_Luminova,Tiny,True,2,0.0,27.3,0,0,27.3X,nil
187,Luminova,3,rbxassetid://97958746390784,PetNew/Level02/12M03_Luminova_Mid,Normal,False,2,0.0,40.45,0,0,40.45X,nil
188,Luminova,3,rbxassetid://97958746390784,PetNew/Level02/12M03_Luminova_Large,Large,False,2,0.0,53.47,0,0,53.47X,nil
189,Luminova,3,rbxassetid://97958746390784,PetNew/Level02/12M03_Luminova,nil,False,2,0.0,1.0,0,0,1X,nil
190,Luminova,3,rbxassetid://97958746390784,PetNew/Level02/12M03_Luminova,nil,False,2,0.0,1.0,0,0,1X,nil
191,Pyrocore,4,rbxassetid://125673790407899,PetNew/Level02/12M04_Pyrocore,Tiny,True,2,0.0,30.5,0,0,30.5X,nil
192,Pyrocore,4,rbxassetid://125673790407899,PetNew/Level02/12M04_Pyrocore_Mid,Normal,False,2,0.0,45.25,0,0,45.25X,nil
193,Pyrocore,4,rbxassetid://125673790407899,PetNew/Level02/12M04_Pyrocore_Large,Large,False,2,0.0,59.85,0,0,59.85X,nil
194,Pyrocore,4,rbxassetid://125673790407899,PetNew/Level02/12M04_Pyrocore,nil,False,2,0.0,1.0,0,0,1X,nil
195,Pyrocore,4,rbxassetid://125673790407899,PetNew/Level02/12M04_Pyrocore,nil,False,2,0.0,1.0,0,0,1X,nil
196,Voidion,4,rbxassetid://107423189403607,PetNew/Level02/12M05_Voidion,Tiny,True,2,0.0,33.5,0,0,33.5X,nil
197,Voidion,4,rbxassetid://107423189403607,PetNew/Level02/12M05_Voidion_Mid,Normal,False,2,0.0,49.75,0,0,49.75X,nil
198,Voidion,4,rbxassetid://107423189403607,PetNew/Level02/12M05_Voidion_Large,Large,False,2,0.0,65.84,0,0,65.84X,nil
199,Voidion,4,rbxassetid://107423189403607,PetNew/Level02/12M05_Voidion,nil,False,2,0.0,1.0,0,0,1X,nil
200,Voidion,4,rbxassetid://107423189403607,PetNew/Level02/12M05_Voidion,nil,False,2,0.0,1.0,0,0,1X,nil
201,Infermo,6,rbxassetid://128833722760603,PetNew/PetsRoblox/Roblox01_Infermo,Tiny,True,4,0.0,12.0,0,0,12X,nil
202,Infermo,6,rbxassetid://128833722760603,PetNew/PetsRoblox/Roblox01_Infermo_Mid,Normal,False,4,0.0,18.0,0,0,18X,nil
203,Infermo,6,rbxassetid://128833722760603,PetNew/PetsRoblox/Roblox01_Infermo_Large,Large,False,4,0.0,24.0,0,0,24X,nil
204,Infermo,6,rbxassetid://128833722760603,PetNew/PetsRoblox/Roblox01_Infermo,nil,False,4,0.0,1.0,0,0,1X,nil
205,Infermo,6,rbxassetid://128833722760603,PetNew/PetsRoblox/Roblox01_Infermo,nil,False,4,0.0,1.0,0,0,1X,nil
206,Loveli,6,rbxassetid://82162367145565,PetNew/PetsRoblox/Roblox02_ Loveli,Tiny,True,4,0.0,28.0,0,0,28X,nil
207,Loveli,6,rbxassetid://82162367145565,PetNew/PetsRoblox/Roblox02_ Loveli_Mid,Normal,False,4,0.0,42.0,0,0,42X,nil
208,Loveli,6,rbxassetid://82162367145565,PetNew/PetsRoblox/Roblox02_ Loveli_Large,Large,False,4,0.0,56.0,0,0,56X,nil
209,Loveli,6,rbxassetid://82162367145565,PetNew/PetsRoblox/Roblox02_ Loveli,nil,False,4,0.0,1.0,0,0,1X,nil
210,Loveli,6,rbxassetid://82162367145565,PetNew/PetsRoblox/Roblox02_ Loveli,nil,False,4,0.0,1.0,0,0,1X,nil
211,HaloHex,5,rbxassetid://78390941572868,PetNew/PetsRoblox/Roblox03_HaloHex,Tiny,True,4,0.8,0.0,0,0,80%,nil
212,HaloHex,5,rbxassetid://78390941572868,PetNew/PetsRoblox/Roblox03_HaloHex_Mid,Normal,False,4,1.2,0.0,0,0,120%,nil
213,HaloHex,5,rbxassetid://78390941572868,PetNew/PetsRoblox/Roblox03_HaloHex_Large,Large,False,4,1.6,0.0,0,0,160%,nil
214,HaloHex,5,rbxassetid://78390941572868,PetNew/PetsRoblox/Roblox03_HaloHex,nil,False,4,0.0,0.0,0,0,0X,nil
215,HaloHex,5,rbxassetid://78390941572868,PetNew/PetsRoblox/Roblox03_HaloHex,nil,False,4,0.0,0.0,0,0,0X,nil
216,Frostbite,5,rbxassetid://100764664840612,PetNew/PetsRoblox/Roblox04_Frostbite,Tiny,True,4,1.5,0.0,0,0,150%,nil
217,Frostbite,5,rbxassetid://100764664840612,PetNew/PetsRoblox/Roblox04_Frostbite_Mid,Normal,False,4,2.25,0.0,0,0,225%,nil
218,Frostbite,5,rbxassetid://100764664840612,PetNew/PetsRoblox/Roblox04_Frostbite_Large,Large,False,4,3.0,0.0,0,0,300%,nil
219,Frostbite,5,rbxassetid://100764664840612,PetNew/PetsRoblox/Roblox04_Frostbite,nil,False,4,0.0,0.0,0,0,0X,nil
220,Frostbite,5,rbxassetid://100764664840612,PetNew/PetsRoblox/Roblox04_Frostbite,nil,False,4,0.0,0.0,0,0,0X,nil
221,Cardbox Demonling,4,rbxassetid://138951244810713,PetNew/SignPet/SignOnline01,Tiny,True,4,0.0,6.8,0,0,6.8X,nil
222,Cardbox Demonling,4,rbxassetid://138951244810713,PetNew/SignPet/SignOnline01_Mid,Normal,False,4,0.0,10.0,0,0,10X,nil
223,Cardbox Demonling,4,rbxassetid://138951244810713,PetNew/SignPet/SignOnline01_Large,Large,False,4,0.0,1.35,0,0,1.35X,nil
224,Cardbox Demonling,4,rbxassetid://138951244810713,PetNew/SignPet/SignOnline01,nil,False,4,0.0,1.0,0,0,1X,nil
225,Cardbox Demonling,4,rbxassetid://138951244810713,PetNew/SignPet/SignOnline01,nil,False,4,0.0,1.0,0,0,1X,nil
226,Stitched Demonkin,4,rbxassetid://112978571737998,PetNew/SignPet/SignOnline02,Tiny,True,4,0.0,9.9,0,0,9.9X,nil
227,Stitched Demonkin,4,rbxassetid://112978571737998,PetNew/SignPet/SignOnline02_Mid,Normal,False,4,0.0,15.0,0,0,15X,nil
228,Stitched Demonkin,4,rbxassetid://112978571737998,PetNew/SignPet/SignOnline02_Large,Large,False,4,0.0,20.0,0,0,20X,nil
229,Stitched Demonkin,4,rbxassetid://112978571737998,PetNew/SignPet/SignOnline02,nil,False,4,0.0,1.0,0,0,1X,nil
230,Stitched Demonkin,4,rbxassetid://112978571737998,PetNew/SignPet/SignOnline02,nil,False,4,0.0,1.0,0,0,1X,nil
231,Rainbowcorn,5,rbxassetid://121468072938857,PetNew/SignPet/SignOnline03,Tiny,True,4,0.0,18.0,0,0,18X,nil
232,Rainbowcorn,5,rbxassetid://121468072938857,PetNew/SignPet/SignOnline03_Mid,Normal,False,4,0.0,27.0,0,0,27X,nil
233,Rainbowcorn,5,rbxassetid://121468072938857,PetNew/SignPet/SignOnline03_Large,Large,False,4,0.0,36.0,0,0,36X,nil
234,Rainbowcorn,5,rbxassetid://121468072938857,PetNew/SignPet/SignOnline03,nil,False,4,0.0,1.0,0,0,1X,nil
235,Rainbowcorn,5,rbxassetid://121468072938857,PetNew/SignPet/SignOnline03,nil,False,4,0.0,1.0,0,0,1X,nil
236,Tinker Wyrmling,4,rbxassetid://121041467889399,PetNew/SignPet/Sign701,Tiny,True,4,0.0,40.0,0,0,40X,nil
237,Tinker Wyrmling,4,rbxassetid://121041467889399,PetNew/SignPet/Sign701_Mid,Normal,False,4,0.0,60.0,0,0,60X,nil
238,Tinker Wyrmling,4,rbxassetid://121041467889399,PetNew/SignPet/Sign701_Large,Large,False,4,0.0,80.0,0,0,80X,nil
239,Tinker Wyrmling,4,rbxassetid://121041467889399,PetNew/SignPet/Sign701,nil,False,4,0.0,1.0,0,0,1X,nil
240,Tinker Wyrmling,4,rbxassetid://121041467889399,PetNew/SignPet/Sign701,nil,False,4,0.0,1.0,0,0,1X,nil
241,Magic Queen,5,rbxassetid://118184927311617,PetNew/SignPet/Sign702,Tiny,True,4,0.0,90.0,0,0,90X,nil
242,Magic Queen,5,rbxassetid://118184927311617,PetNew/SignPet/Sign702_Mid,Normal,False,4,0.0,135.0,0,0,135X,nil
243,Magic Queen,5,rbxassetid://118184927311617,PetNew/SignPet/Sign702_Large,Large,False,4,0.0,180.0,0,0,180X,nil
244,Magic Queen,5,rbxassetid://118184927311617,PetNew/SignPet/Sign702,nil,False,4,0.0,1.0,0,0,1X,nil
245,Magic Queen,5,rbxassetid://118184927311617,PetNew/SignPet/Sign702,nil,False,4,0.0,1.0,0,0,1X,nil
246,Crimson,5,rbxassetid://130219904784080,PetNew/SignPet/SignMax,Tiny,True,4,0.0,500.0,0,0,500X,nil
247,Crimson,5,rbxassetid://130219904784080,PetNew/SignPet/SignMax_Mid,Normal,False,4,0.0,750.0,0,0,750X,nil
248,Crimson,5,rbxassetid://130219904784080,PetNew/SignPet/SignMax_Large,Large,False,4,0.0,1000.0,0,0,1000X,nil
249,Crimson,5,rbxassetid://130219904784080,PetNew/SignPet/Sign702,nil,False,4,0.0,1.0,0,0,1X,nil
250,Crimson,5,rbxassetid://130219904784080,PetNew/SignPet/Sign702,nil,False,4,0.0,1.0,0,0,1X,nil
251,Holywing,5,rbxassetid://96427321607903,PetNew/PetsRoblox/Newbie02,Tiny,True,4,0.0,1000.0,0,0,1000X,ProductStorePet251
252,Holywing,5,rbxassetid://96427321607903,PetNew/PetsRoblox/Newbie02_Mid,Normal,False,4,0.0,1500.0,0,0,1500X,nil
253,Holywing,5,rbxassetid://96427321607903,PetNew/PetsRoblox/Newbie02_Large,Large,False,4,0.0,2000.0,0,0,2000X,nil
254,Holywing,5,rbxassetid://96427321607903,PetNew/PetsRoblox/Newbie02,nil,False,4,0.0,1.0,0,0,1X,nil
255,Holywing,5,rbxassetid://96427321607903,PetNew/PetsRoblox/Newbie02,nil,False,4,0.0,1.0,0,0,1X,nil
256,Abyss,5,rbxassetid://80387007915967,PetNew/PetsRoblox/Newbie03,Tiny,True,4,0.0,1500.0,0,0,1500X,ProductStorePet256
257,Abyss,5,rbxassetid://80387007915967,PetNew/PetsRoblox/Newbie03_Mid,Normal,False,4,0.0,2250.0,0,0,2250X,nil
258,Abyss,5,rbxassetid://80387007915967,PetNew/PetsRoblox/Newbie03_Large,Large,False,4,0.0,3000.0,0,0,3000X,nil
259,Abyss,5,rbxassetid://80387007915967,PetNew/PetsRoblox/Newbie03,nil,False,4,0.0,1.0,0,0,1X,nil
260,Abyss,5,rbxassetid://80387007915967,PetNew/PetsRoblox/Newbie03,nil,False,4,0.0,1.0,0,0,1X,nil
261,VerdantShard,1,rbxassetid://89029589362419,PetNew/Level03/52M01,Tiny,True,3,0.0,32.5,0,0,32.5X,nil
262,VerdantShard,1,rbxassetid://89029589362419,PetNew/Level03/52M01_Mid,Normal,False,3,0.0,48.75,0,0,48.75X,nil
263,VerdantShard,1,rbxassetid://89029589362419,PetNew/Level03/52M01_Large,Large,False,3,0.0,64.8,0,0,64.8X,nil
264,VerdantShard,1,rbxassetid://89029589362419,PetNew/Level03/52M01,nil,False,3,0.0,1.0,0,0,1X,nil
265,VerdantShard,1,rbxassetid://89029589362419,PetNew/Level03/52M01,nil,False,3,0.0,1.0,0,0,1X,nil
266,FrostShard,2,rbxassetid://103631935951917,PetNew/Level03/52M02,Tiny,True,3,0.0,33.5,0,0,33.5X,nil
267,FrostShard,2,rbxassetid://103631935951917,PetNew/Level03/52M02_Mid,Normal,False,3,0.0,50.25,0,0,50.25X,nil
268,FrostShard,2,rbxassetid://103631935951917,PetNew/Level03/52M02_Large,Large,False,3,0.0,66.8,0,0,66.8X,nil
269,FrostShard,2,rbxassetid://103631935951917,PetNew/Level03/52M02,nil,False,3,0.0,1.0,0,0,1X,nil
270,FrostShard,2,rbxassetid://103631935951917,PetNew/Level03/52M02,nil,False,3,0.0,1.0,0,0,1X,nil
271,ArcaneShard,3,rbxassetid://81657116913258,PetNew/Level03/52M03,Tiny,True,3,0.0,36.0,0,0,36X,nil
272,ArcaneShard,3,rbxassetid://81657116913258,PetNew/Level03/52M03_Mid,Normal,False,3,0.0,54.0,0,0,54X,nil
273,ArcaneShard,3,rbxassetid://81657116913258,PetNew/Level03/52M03_Large,Large,False,3,0.0,71.82000000000001,0,0,71.82X,nil
274,ArcaneShard,3,rbxassetid://81657116913258,PetNew/Level03/52M03,nil,False,3,0.0,1.0,0,0,1X,nil
275,ArcaneShard,3,rbxassetid://81657116913258,PetNew/Level03/52M03,nil,False,3,0.0,1.0,0,0,1X,nil
276,InfernoShard,4,rbxassetid://133150422484036,PetNew/Level03/52M04,Tiny,True,3,0.0,38.8,0,0,38.8X,nil
277,InfernoShard,4,rbxassetid://133150422484036,PetNew/Level03/52M04_Mid,Normal,False,3,0.0,58.199999999999996,0,0,58.2X,nil
278,InfernoShard,4,rbxassetid://133150422484036,PetNew/Level03/52M04_Large,Large,False,3,0.0,77.4,0,0,77.4X,nil
279,InfernoShard,4,rbxassetid://133150422484036,PetNew/Level03/52M04,nil,False,3,0.0,1.0,0,0,1X,nil
280,InfernoShard,4,rbxassetid://133150422484036,PetNew/Level03/52M04,nil,False,3,0.0,1.0,0,0,1X,nil
281,VoidShard,4,rbxassetid://139639986153724,PetNew/Level03/52M05,Tiny,True,3,0.0,42.3,0,0,42.3X,nil
282,VoidShard,4,rbxassetid://139639986153724,PetNew/Level03/52M05_Mid,Normal,False,3,0.0,63.449999999999996,0,0,63.45X,nil
283,VoidShard,4,rbxassetid://139639986153724,PetNew/Level03/52M05_Large,Large,False,3,0.0,84.3,0,0,84.3X,nil
284,VoidShard,4,rbxassetid://139639986153724,PetNew/Level03/52M05,nil,False,3,0.0,1.0,0,0,1X,nil
285,VoidShard,4,rbxassetid://139639986153724,PetNew/Level03/52M05,nil,False,3,0.0,1.0,0,0,1X,nil
286,NatureCore,1,rbxassetid://78483603362131,PetNew/Level03/210M01,Tiny,True,3,0.0,34.0,0,0,34X,nil
287,NatureCore,1,rbxassetid://78483603362131,PetNew/Level03/210M01_Mid,Normal,False,3,0.0,51.0,0,0,51X,nil
288,NatureCore,1,rbxassetid://78483603362131,PetNew/Level03/210M01_Large,Large,False,3,0.0,67.83,0,0,67.83X,nil
289,NatureCore,1,rbxassetid://78483603362131,PetNew/Level03/210M01,nil,False,3,0.0,1.0,0,0,1X,nil
290,NatureCore,1,rbxassetid://78483603362131,PetNew/Level03/210M01,nil,False,3,0.0,1.0,0,0,1X,nil
291,ShadowCore,2,rbxassetid://107028468395283,PetNew/Level03/210M02,Tiny,True,3,0.0,35.2,0,0,35.2X,nil
292,ShadowCore,2,rbxassetid://107028468395283,PetNew/Level03/210M02_Mid,Normal,False,3,0.0,52.800000000000004,0,0,52.8X,nil
293,ShadowCore,2,rbxassetid://107028468395283,PetNew/Level03/210M02_Large,Large,False,3,0.0,70.22,0,0,70.22X,nil
294,ShadowCore,2,rbxassetid://107028468395283,PetNew/Level03/210M02,nil,False,3,0.0,1.0,0,0,1X,nil
295,ShadowCore,2,rbxassetid://107028468395283,PetNew/Level03/210M02,nil,False,3,0.0,1.0,0,0,1X,nil
296,AngelCore,3,rbxassetid://77099667734453,PetNew/Level03/210M03,Tiny,True,3,0.0,37.1,0,0,37.1X,nil
297,AngelCore,3,rbxassetid://77099667734453,PetNew/Level03/210M03_Mid,Normal,False,3,0.0,55.650000000000006,0,0,55.65X,nil
298,AngelCore,3,rbxassetid://77099667734453,PetNew/Level03/210M03_Large,Large,False,3,0.0,74.0,0,0,74X,nil
299,AngelCore,3,rbxassetid://77099667734453,PetNew/Level03/210M03,nil,False,3,0.0,1.0,0,0,1X,nil
300,AngelCore,3,rbxassetid://77099667734453,PetNew/Level03/210M03,nil,False,3,0.0,1.0,0,0,1X,nil
301,FlameCore,4,rbxassetid://96769369371376,PetNew/Level03/210M04,Tiny,True,3,0.0,40.0,0,0,40X,nil
302,FlameCore,4,rbxassetid://96769369371376,PetNew/Level03/210M04_Mid,Normal,False,3,0.0,60.0,0,0,60X,nil
303,FlameCore,4,rbxassetid://96769369371376,PetNew/Level03/210M04_Large,Large,False,3,0.0,79.80000000000001,0,0,79.8X,nil
304,FlameCore,4,rbxassetid://96769369371376,PetNew/Level03/210M04,nil,False,3,0.0,1.0,0,0,1X,nil
305,FlameCore,4,rbxassetid://96769369371376,PetNew/Level03/210M04,nil,False,3,0.0,1.0,0,0,1X,nil
306,SunCore,4,rbxassetid://71619341682288,PetNew/Level03/210M05,Tiny,True,3,0.0,45.0,0,0,45X,nil
307,SunCore,4,rbxassetid://71619341682288,PetNew/Level03/210M05_Mid,Normal,False,3,0.0,67.5,0,0,67.5X,nil
308,SunCore,4,rbxassetid://71619341682288,PetNew/Level03/210M05_Large,Large,False,3,0.0,89.7,0,0,89.7X,nil
309,SunCore,4,rbxassetid://71619341682288,PetNew/Level03/210M05,nil,False,3,0.0,1.0,0,0,1X,nil
310,SunCore,4,rbxassetid://71619341682288,PetNew/Level03/210M05,nil,False,3,0.0,1.0,0,0,1X,nil
311,SlimeBud,1,rbxassetid://120139927477903,PetNew/Level03/840M01,Tiny,True,3,0.0,35.6,0,0,35.6X,nil
312,SlimeBud,1,rbxassetid://120139927477903,PetNew/Level03/840M01_Mid,Normal,False,3,0.0,53.400000000000006,0,0,53.4X,nil
313,SlimeBud,1,rbxassetid://120139927477903,PetNew/Level03/840M01_Large,Large,False,3,0.0,71.0,0,0,71X,nil
314,SlimeBud,1,rbxassetid://120139927477903,PetNew/Level03/840M01,nil,False,3,0.0,1.0,0,0,1X,nil
315,SlimeBud,1,rbxassetid://120139927477903,PetNew/Level03/840M01,nil,False,3,0.0,1.0,0,0,1X,nil
316,CrystalCrab,2,rbxassetid://81273924367666,PetNew/Level03/840M02,Tiny,True,3,0.0,37.0,0,0,37X,nil
317,CrystalCrab,2,rbxassetid://81273924367666,PetNew/Level03/840M02_Mid,Normal,False,3,0.0,55.5,0,0,55.5X,nil
318,CrystalCrab,2,rbxassetid://81273924367666,PetNew/Level03/840M02_Large,Large,False,3,0.0,73.8,0,0,73.8X,nil
319,CrystalCrab,2,rbxassetid://81273924367666,PetNew/Level03/840M02,nil,False,3,0.0,1.0,0,0,1X,nil
320,CrystalCrab,2,rbxassetid://81273924367666,PetNew/Level03/840M02,nil,False,3,0.0,1.0,0,0,1X,nil
321,ArcaneClaw,3,rbxassetid://105493313037234,PetNew/Level03/840M03,Tiny,True,3,0.0,39.1,0,0,39.1X,nil
322,ArcaneClaw,3,rbxassetid://105493313037234,PetNew/Level03/840M03_Mid,Normal,False,3,0.0,58.650000000000006,0,0,58.65X,nil
323,ArcaneClaw,3,rbxassetid://105493313037234,PetNew/Level03/840M03_Lare,Large,False,3,0.0,78.0,0,0,78X,nil
324,ArcaneClaw,3,rbxassetid://105493313037234,PetNew/Level03/840M03,nil,False,3,0.0,1.0,0,0,1X,nil
325,ArcaneClaw,3,rbxassetid://105493313037234,PetNew/Level03/840M03,nil,False,3,0.0,1.0,0,0,1X,nil
326,FlameBrute,4,rbxassetid://128186301865101,PetNew/Level03/840M04,Tiny,True,3,0.0,42.5,0,0,42.5X,nil
327,FlameBrute,4,rbxassetid://128186301865101,PetNew/Level03/840M04_Mid,Normal,False,3,0.0,63.75,0,0,63.75X,nil
328,FlameBrute,4,rbxassetid://128186301865101,PetNew/Level03/840M04_Large,Large,False,3,0.0,84.7,0,0,84.7X,nil
329,FlameBrute,4,rbxassetid://128186301865101,PetNew/Level03/840M04,nil,False,3,0.0,1.0,0,0,1X,nil
330,FlameBrute,4,rbxassetid://128186301865101,PetNew/Level03/840M04,nil,False,3,0.0,1.0,0,0,1X,nil
331,SolarDominator,4,rbxassetid://132828270324812,PetNew/Level03/840M05,Tiny,True,3,0.0,46.7,0,0,46.7X,nil
332,SolarDominator,4,rbxassetid://132828270324812,PetNew/Level03/840M05_Mid,Normal,False,3,0.0,70.05000000000001,0,0,70.05X,nil
333,SolarDominator,4,rbxassetid://132828270324812,PetNew/Level03/840M05_Large,Large,False,3,0.0,93.1,0,0,93.1X,nil
334,SolarDominator,4,rbxassetid://132828270324812,PetNew/Level03/840M05,nil,False,3,0.0,1.0,0,0,1X,nil
335,SolarDominator,4,rbxassetid://132828270324812,PetNew/Level03/840M05,nil,False,3,0.0,1.0,0,0,1X,nil
336,EmeraldGem,1,rbxassetid://99175632344236,PetNew/Level03/3B01,Tiny,True,3,0.0,38.1,0,0,38.1X,nil
337,EmeraldGem,1,rbxassetid://99175632344236,PetNew/Level03/3B01_Mid,Normal,False,3,0.0,57.150000000000006,0,0,57.15X,nil
338,EmeraldGem,1,rbxassetid://99175632344236,PetNew/Level03/3B01_Large,Large,False,3,0.0,76.0,0,0,76X,nil
339,EmeraldGem,1,rbxassetid://99175632344236,PetNew/Level03/3B01,nil,False,3,0.0,1.0,0,0,1X,nil
340,EmeraldGem,1,rbxassetid://99175632344236,PetNew/Level03/3B01,nil,False,3,0.0,1.0,0,0,1X,nil
341,SapphireGem,2,rbxassetid://122403592627819,PetNew/Level03/3B02,Tiny,True,3,0.0,39.3,0,0,39.3X,nil
342,SapphireGem,2,rbxassetid://122403592627819,PetNew/Level03/3B02_Mid,Normal,False,3,0.0,58.949999999999996,0,0,58.95X,nil
343,SapphireGem,2,rbxassetid://122403592627819,PetNew/Level03/3B02_Large,Large,False,3,0.0,78.4,0,0,78.4X,nil
344,SapphireGem,2,rbxassetid://122403592627819,PetNew/Level03/3B02,nil,False,3,0.0,1.0,0,0,1X,nil
345,SapphireGem,2,rbxassetid://122403592627819,PetNew/Level03/3B02,nil,False,3,0.0,1.0,0,0,1X,nil
346,Amethyst Crown,3,rbxassetid://111137937410636,PetNew/Level03/3B03,Tiny,True,3,0.0,41.6,0,0,41.6X,nil
347,Amethyst Crown,3,rbxassetid://111137937410636,PetNew/Level03/3B03_Mid,Normal,False,3,0.0,62.400000000000006,0,0,62.4X,nil
348,Amethyst Crown,3,rbxassetid://111137937410636,PetNew/Level03/3B03_Large,Large,False,3,0.0,83.0,0,0,83X,nil
349,Amethyst Crown,3,rbxassetid://111137937410636,PetNew/Level03/3B03,nil,False,3,0.0,1.0,0,0,1X,nil
350,Amethyst Crown,3,rbxassetid://111137937410636,PetNew/Level03/3B03,nil,False,3,0.0,1.0,0,0,1X,nil
351,Ruby Wings,4,rbxassetid://87419362750249,PetNew/Level03/3B04,Tiny,True,3,0.0,44.5,0,0,44.5X,nil
352,Ruby Wings,4,rbxassetid://87419362750249,PetNew/Level03/3B04_Mid,Normal,False,3,0.0,66.75,0,0,66.75X,nil
353,Ruby Wings,4,rbxassetid://87419362750249,PetNew/Level03/3B04_Large,Large,False,3,0.0,89.0,0,0,89X,nil
354,Ruby Wings,4,rbxassetid://87419362750249,PetNew/Level03/3B04,nil,False,3,0.0,1.0,0,0,1X,nil
355,Ruby Wings,4,rbxassetid://87419362750249,PetNew/Level03/3B04,nil,False,3,0.0,1.0,0,0,1X,nil
356,Golden Relic,4,rbxassetid://124374738935791,PetNew/Level03/3B05,Tiny,True,3,0.0,49.5,0,0,49.5X,nil
357,Golden Relic,4,rbxassetid://124374738935791,PetNew/Level03/3B05_Mid,Normal,False,3,0.0,74.25,0,0,74.25X,nil
358,Golden Relic,4,rbxassetid://124374738935791,PetNew/Level03/3B05_Large,Large,False,3,0.0,99.0,0,0,99X,nil
359,Golden Relic,4,rbxassetid://124374738935791,PetNew/Level03/3B05,nil,False,3,0.0,1.0,0,0,1X,nil
360,Golden Relic,4,rbxassetid://124374738935791,PetNew/Level03/3B05,nil,False,3,0.0,1.0,0,0,1X,nil
361,Hipopotamo,6,rbxassetid://95979472459104,PetNew/PetsRoblox/Brainrot01,Tiny,True,4,0.0,35.0,0,0,35X,nil
362,Hipopotamo,6,rbxassetid://95979472459104,PetNew/PetsRoblox/Brainrot01_Mid,Normal,False,4,0.0,52.5,0,0,52.5X,nil
363,Hipopotamo,6,rbxassetid://95979472459104,PetNew/PetsRoblox/Brainrot01_Large,Large,False,4,0.0,70.0,0,0,70X,nil
364,Hipopotamo,6,rbxassetid://95979472459104,PetNew/PetsRoblox/Brainrot01,nil,False,4,0.0,1.0,0,0,1X,nil
365,Hipopotamo,6,rbxassetid://95979472459104,PetNew/PetsRoblox/Brainrot01,nil,False,4,0.0,1.0,0,0,1X,nil
366,Odin DinDin Dun,6,rbxassetid://94959290083015,PetNew/PetsRoblox/Brainrot03,Tiny,True,4,0.0,60.0,0,0,60X,nil
367,Odin DinDin Dun,6,rbxassetid://94959290083015,PetNew/PetsRoblox/Brainrot03_Mid,Normal,False,4,0.0,90.0,0,0,90X,nil
368,Odin DinDin Dun,6,rbxassetid://94959290083015,PetNew/PetsRoblox/Brainrot03_Large,Large,False,4,0.0,120.0,0,0,120X,nil
369,Odin DinDin Dun,6,rbxassetid://94959290083015,PetNew/PetsRoblox/Brainrot03,nil,False,4,0.0,1.0,0,0,1X,nil
370,Odin DinDin Dun,6,rbxassetid://94959290083015,PetNew/PetsRoblox/Brainrot03,nil,False,4,0.0,1.0,0,0,1X,nil
371,Chimpanzini Bananini,5,rbxassetid://100896048702275,PetNew/PetsRoblox/Brainrot04,Tiny,True,4,1.2,0.0,0,0,120%,nil
372,Chimpanzini Bananini,5,rbxassetid://100896048702275,PetNew/PetsRoblox/Brainrot04_Mid,Normal,False,4,1.8,0.0,0,0,180%,nil
373,Chimpanzini Bananini,5,rbxassetid://100896048702275,PetNew/PetsRoblox/Brainrot04_Large,Large,False,4,2.4,0.0,0,0,240%,nil
374,Chimpanzini Bananini,5,rbxassetid://100896048702275,PetNew/PetsRoblox/Brainrot04,nil,False,4,0.0,0.0,0,0,0X,nil
375,Chimpanzini Bananini,5,rbxassetid://100896048702275,PetNew/PetsRoblox/Brainrot04,nil,False,4,0.0,0.0,0,0,0X,nil
376,Tralalero Tralala,5,rbxassetid://130142716335793,PetNew/PetsRoblox/Brainrot05,Tiny,True,4,2.0,0.0,0,0,200%,nil
377,Tralalero Tralala,5,rbxassetid://130142716335793,PetNew/PetsRoblox/Brainrot05_Mid,Normal,False,4,3.0,0.0,0,0,300%,nil
378,Tralalero Tralala,5,rbxassetid://130142716335793,PetNew/PetsRoblox/Brainrot05_Large,Large,False,4,4.0,0.0,0,0,400%,nil
379,Tralalero Tralala,5,rbxassetid://130142716335793,PetNew/PetsRoblox/Brainrot05,nil,False,4,0.0,0.0,0,0,0X,nil
380,Tralalero Tralala,5,rbxassetid://130142716335793,PetNew/PetsRoblox/Brainrot05,nil,False,4,0.0,0.0,0,0,0X,nil
381,Ragekin,2,rbxassetid://107457012377726,PetNew/Season/Season01Pet01,Tiny,True,5,0.0,24.5,0,0,24.5X,nil
382,Ragekin,2,rbxassetid://107457012377726,PetNew/Season/Season01Pet01_Mid,Normal,False,5,0.0,36.75,0,0,36.75X,nil
383,Ragekin,2,rbxassetid://107457012377726,PetNew/Season/Season01Pet01_Large,Large,False,5,0.0,49.0,0,0,49X,nil
384,Ragekin,2,rbxassetid://107457012377726,PetNew/Season/Season01Pet01,nil,False,5,0.0,1.0,0,0,1X,nil
385,Ragekin,2,rbxassetid://107457012377726,PetNew/Season/Season01Pet01,nil,False,5,0.0,1.0,0,0,1X,nil
386,Blossom Wisp,3,rbxassetid://112122956502520,PetNew/Season/Season01Pet02,Tiny,True,5,0.0,37.8,0,0,37.8X,nil
387,Blossom Wisp,3,rbxassetid://112122956502520,PetNew/Season/Season01Pet02_Mid,Normal,False,5,0.0,56.699999999999996,0,0,56.7X,nil
388,Blossom Wisp,3,rbxassetid://112122956502520,PetNew/Season/Season01Pet02_Large,Large,False,5,0.0,75.6,0,0,75.6X,nil
389,Blossom Wisp,3,rbxassetid://112122956502520,PetNew/Season/Season01Pet02,nil,False,5,0.0,1.0,0,0,1X,nil
390,Blossom Wisp,3,rbxassetid://112122956502520,PetNew/Season/Season01Pet02,nil,False,5,0.0,1.0,0,0,1X,nil
391,Frostbite,4,rbxassetid://110869709499336,PetNew/Season/Season01Pet03,Tiny,True,5,0.0,56.5,0,0,56.5X,nil
392,Frostbite,4,rbxassetid://110869709499336,PetNew/Season/Season01Pet03_Mid,Normal,False,5,0.0,84.75,0,0,84.75X,nil
393,Frostbite,4,rbxassetid://110869709499336,PetNew/Season/Season01Pet03_Large,Large,False,5,0.0,113.0,0,0,113X,nil
394,Frostbite,4,rbxassetid://110869709499336,PetNew/Season/Season01Pet03,nil,False,5,0.0,0.0,0,0,0X,nil
395,Frostbite,4,rbxassetid://110869709499336,PetNew/Season/Season01Pet03,nil,False,5,0.0,0.0,0,0,0X,nil
396,Barrel Blitz,6,rbxassetid://134167782460094,PetNew/Season/Season01Pet04,Tiny,True,5,0.0,84.8,0,0,84.8X,nil
397,Barrel Blitz,6,rbxassetid://134167782460094,PetNew/Season/Season01Pet04_Mid,Normal,False,5,0.0,127.19999999999999,0,0,127.2X,nil
398,Barrel Blitz,6,rbxassetid://134167782460094,PetNew/Season/Season01Pet04_Large,Large,False,5,0.0,169.6,0,0,169.6X,nil
399,Barrel Blitz,6,rbxassetid://134167782460094,PetNew/Season/Season01Pet04,nil,False,5,0.0,1.0,0,0,1X,nil
400,Barrel Blitz,6,rbxassetid://134167782460094,PetNew/Season/Season01Pet04,nil,False,5,0.0,1.0,0,0,1X,nil
401,ToxiSkull,5,rbxassetid://125967433540956,PetNew/Season/Season01Pet05,Tiny,False,5,1.5,0.0,0,0,150%,nil
402,ToxiSkull,5,rbxassetid://125967433540956,PetNew/Season/Season01Pet05_Mid,Normal,False,5,2.25,0.0,0,0,225%,nil
403,ToxiSkull,5,rbxassetid://125967433540956,PetNew/Season/Season01Pet05_Large,Large,True,5,3.0,0.0,0,0,300%,nil
404,ToxiSkull,5,rbxassetid://125967433540956,PetNew/Season/Season01Pet05,nil,False,5,0.0,0.0,0,0,0X,nil
405,ToxiSkull,5,rbxassetid://125967433540956,PetNew/Season/Season01Pet05,nil,False,5,0.0,0.0,0,0,0X,nil
406,Frost Cub,3,rbxassetid://91005074061121,PetNew/Christmas/ChristmasPet01,Tiny,True,5,0.0,36.0,0,0,36X,nil
407,Frost Cub,3,rbxassetid://91005074061121,PetNew/Christmas/ChristmasPet01_Mid,Normal,False,5,0.0,54.0,0,0,54X,nil
408,Frost Cub,3,rbxassetid://91005074061121,PetNew/Christmas/ChristmasPet01_Large,Large,False,5,0.0,72.0,0,0,72X,nil
409,Frost Cub,3,rbxassetid://91005074061121,PetNew/Christmas/ChristmasPet01,nil,False,5,0.0,1.0,0,0,1X,nil
410,Frost Cub,3,rbxassetid://91005074061121,PetNew/Christmas/ChristmasPet01,nil,False,5,0.0,1.0,0,0,1X,nil
411,Pinky Waddle,4,rbxassetid://70465789424927,PetNew/Christmas/ChristmasPet02,Tiny,True,5,0.0,54.0,0,0,54X,nil
412,Pinky Waddle,4,rbxassetid://70465789424927,PetNew/Christmas/ChristmasPet02_Mid,Normal,False,5,0.0,81.0,0,0,81X,nil
413,Pinky Waddle,4,rbxassetid://70465789424927,PetNew/Christmas/ChristmasPet02_Large,Large,False,5,0.0,108.0,0,0,108X,nil
414,Pinky Waddle,4,rbxassetid://70465789424927,PetNew/Christmas/ChristmasPet02,nil,False,5,0.0,0.0,0,0,0X,nil
415,Pinky Waddle,4,rbxassetid://70465789424927,PetNew/Christmas/ChristmasPet02,nil,False,5,0.0,0.0,0,0,0X,nil
416,Flame Tail,6,rbxassetid://90057588146086,PetNew/Christmas/ChristmasPet03,Tiny,True,5,0.0,82.0,0,0,82X,nil
417,Flame Tail,6,rbxassetid://90057588146086,PetNew/Christmas/ChristmasPet03_Mid,Normal,False,5,0.0,123.0,0,0,123X,nil
418,Flame Tail,6,rbxassetid://90057588146086,PetNew/Christmas/ChristmasPet03_Large,Large,False,5,0.0,164.0,0,0,164X,nil
419,Flame Tail,6,rbxassetid://90057588146086,PetNew/Christmas/ChristmasPet03,nil,False,5,0.0,1.0,0,0,1X,nil
420,Flame Tail,6,rbxassetid://90057588146086,PetNew/Christmas/ChristmasPet03,nil,False,5,0.0,1.0,0,0,1X,nil
421,Sir Whisker,6,rbxassetid://88902898550793,PetNew/Christmas/ChristmasPet04_Mid,Tiny,True,5,0.0,125.0,0,0,125X,nil
422,Sir Whisker,6,rbxassetid://88902898550793,PetNew/Christmas/ChristmasPet04_Large,Normal,False,5,0.0,187.5,0,0,187.5X,nil
423,Sir Whisker,6,rbxassetid://88902898550793,PetNew/Christmas/ChristmasPet04,Large,False,5,0.0,250.0,0,0,250X,nil
424,Sir Whisker,6,rbxassetid://88902898550793,PetNew/Christmas/ChristmasPet04,nil,False,5,0.0,1.0,0,0,1X,nil
425,Sir Whisker,6,rbxassetid://88902898550793,PetNew/Christmas/ChristmasPet04,nil,False,5,0.0,1.0,0,0,1X,nil
426,Snowmelt,5,rbxassetid://84442185399942,PetNew/Christmas/ChristmasPet05,Tiny,False,5,1.0,0.0,0,0,100%,nil
427,Snowmelt,5,rbxassetid://84442185399942,PetNew/Christmas/ChristmasPet05_Mid,Normal,False,5,1.5,0.0,0,0,150%,nil
428,Snowmelt,5,rbxassetid://84442185399942,PetNew/Christmas/ChristmasPet05_Large,Large,True,5,2.0,0.0,0,0,200%,nil
429,Snowmelt,5,rbxassetid://84442185399942,PetNew/Christmas/ChristmasPet05,nil,False,5,0.0,0.0,0,0,0X,nil
430,Snowmelt,5,rbxassetid://84442185399942,PetNew/Christmas/ChristmasPet05,nil,False,5,0.0,0.0,0,0,0X,nil
]]

return PetConfig