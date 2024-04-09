module maximumDraws_test

    using JHRank
    using JHRank.MathematicsEasyModule
    using Test

    function test()
        for i = 1:9999:10^6
            @test maximumDraws(i) == i+1
        end
    end

end # module maximumDraws_test

using .maximumDraws_test
maximumDraws_test.test()

module lowestTriangle_test

    using JHRank
    using JHRank.MathematicsEasyModule
    using Test

    function test()
        # HR
        @test lowestTriangle(4, 6) == 3
        @test lowestTriangle(2, 2) == 2
        @test lowestTriangle(17, 100) == 12
    end

end # module lowestTriangle_test

using .lowestTriangle_test
lowestTriangle_test.test()

module gameWithCells_test

    using JHRank
    using JHRank.MathematicsEasyModule
    using Test

    function test()
        # HR
        @test gameWithCells(2, 3) == 2
        @test gameWithCells(2, 2) == 1
        @test gameWithCells(1, 1) == 1
        @test gameWithCells(25, 25) == 169
    end

end # module gameWithCells_test

using .gameWithCells_test
gameWithCells_test.test()

module handshake_test

    using JHRank
    using JHRank.MathematicsEasyModule
    using Test

    function test()
        # Base cases
        @test handshake(0) == 0
        @test handshake(1) == 0
        @test handshake(2) == 1

        # Various (HR)
        inputs = [
            2924,7062,7105,4716,9111,6913,1421,9429,2378,4540,9243,544,2898,298,6607,4585,1940,8635,5490,8456,4913,5788,9975,9536,1810,5396,103,7349,438,1916,1105,
            8690,6767,1869,8552,4652,5591,890,4494,4695,3567,7945,3752,7690,8886,4504,5411,1329,876,4545,3916,3726,6880,2589,1071,673,7623,3758,7011,6770,8221,7584,3703,9545,
            5208,3814,27,1885,2901,7257,7118,1131,7891,2039,583,2322,8795,5609,8056,2317,2297,5321,9108,9506,8223,3548,4147,5201,50,4824,2331,6215,8353,7613,8888,7211,
            4902,1644,8514,8746,1150,6957,2775,2801,705,7333,4312,1893,5041,8378,2429,4348,5446,9650,1634,3118,5368,5782,7897,4718,3867,739,2353,5654,5422,1540,9226,1368,
            9923,8482,5499,6277,1618,6285,6903,3071,855,632,6419,7984,3872,4283,743,5635,8399,1161,8327,5278,2041,2071,3012,9996,3817,6295,7854,3741,6561,9505,7582,6681,1459,1786,
            8048,6386,6868,6482,1364,3679,2062,8727,5029,2978,4338,7258,3052,3992,4397,8902,4226,9739,5255,6818,3284,6469,9793,7608,4060,7820,1679,1843,6135,4108,1177,4039,4508,
            8731,9430,4616,9816,9772,8204,5258,4157,4917,1937,3639,5633,8267,1393,4742,691,2323,9297,4600,2641,1720,9115,8092,9348,9060,980,878,4022,4326,4977,3256,566,
            1010,5332,4179,1650,4108,2601,2387,9912,4520,7658,3798,5065,9493,4477,8367,4273,8399,3131,9118,6122,9481,5872,179,7303,8385,2752,5646,8035,2148,4024,4525,5832,
            908,1975,6793,4805,2716,515,2213,6130,8855,4786,252,9516,8951,1832,5083,8754,4584,2316,4140,5752,2623,5812,1230,5675,5258,399,2503,7045,3982,8449,1551,9687,2983,509,
            4451,6109,7029,1408,5332,9200,953,7561,849,1271,4506,9239,4430,4291,8451,5989,572,2628,6623,4495,2676,6725,6817,7805,2086,3597,6953,289,3822,9726,6257,232,5945,
            4215,2544,5730,8826,1940,454,4841,3379,610,6246,932,1011,4834,1496,2209,3646,2336,3981,2072,8012,1181,5644,2175,2703,6536,6594,4909,5837,2584,9157,2224,2304,1856,2255,7343,
            9503,7257,8377,4818,7954,8225,4190,1334,6525,8277,3183,2909,925,2425,9708,4266,2527,7310,5370,8395,5106,985,6928,9516,114,2288,7226,2960,7000,89,3056,951,1552,8357,5993,8518,3884,6013,
            955,6399,4701,882,9241,592,1746,656,6264,7413,5030,755,5371,7198,443,1806,8855,6205,6545,9111,2032,2011,6077,9855,9182,596,8068,5068,2492,9906,7079,8137,2272,7104,4782,4595,4750,
            4802,4287,1189,4816,6215,8705,8722,1484,5538,7162,4665,7056,8482,8675,1308,1726,9912,2083,9487,1177,7799,8620,9875,9298,5531,8508,4731,8784,3228,4733,3630,5244,780,8614,7790,2614,
            1732,2289,166,4014,3924,9943,7558,798,4529,8877,8680,7910,3852,2562,7556,216,5716,4296,498,1485,2275,5978,9224,6514,8799,8182,5766,7587,6977,3336,9525,2586,3850,586,671,
            938,8113,3778,4750,7065,7491,5159,5416,2667,4292,125,8281,9764,1982,3126,3589,4395,9986,9170,3863,7474,9211,7168,3747,6689,1850,1132,7333,1458,9572,9981,1479,2220,5083,
            4202,5172,9228,484,9100,7975,6214,5286,9252,290,4091,4197,2996,4037,5088,3519,4335,2034,2139,2789,2908,8859,1389,5863,9643,8885,7985,2570,5358,7399,5929,8615,1455,4545,2970,6949,
            1861,9313,974,5911,4405,3994,6747,8589,6467,2421,33,2245,8819,8012,1465,9032,9769,3571,6322,4515,6564,8703,1413,1522,8550,7136,4047,6975,3095,9489,3236,867,7712,328,9304,
            2192,7641,4999,8676,6238,6163,4129,2514,5124,1749,6002,1141,8276,1155,4668,2746,1574,5059,442,7934,2126,7927,7877,4647,2840,1328,204,4345,1225,9526,6553,1517,8400,4683,701,8592,7499,
            5775,5015,1845,9370,6045,5062,3444,4299,2426,6869,2602,8595,9927,9201,1338,1614,7369,2791,2311,2869,3000,5226,8328,7382,6206,7808,1471,4348,6306,3064,8506,3709,7911,1183,9644
        ]
        expected_outputs = [
            4273426,24932391,25236960,11117970,41500605,23891328,1008910,44448306,2826253,10303530,42711903,147696,4197753,44253,21822921,10508820,1880830,37277295,15067305,35747740,12066328,16747578,49745325,45462880,1637145,14555710,5253,27000226,95703,1834570,609960,
            37753705,22892761,1745646,36564076,10818226,15626845,395605,10095771,11019165,6359961,31557540,7036876,29564205,39476055,10140756,14636755,882456,383250,10326240,7665570,6939675,23663760,3350166,572985,226128,29051253,7059403,24573555,22913065,33788310,
            28754736,6854253,45548740,13559028,7271391,351,1775670,4206450,26328396,25329403,639015,31129995,2077741,169653,2694681,38671615,15727636,32445540,2683086,2636956,14153860,41473278,45177265,33804753,6292378,8596731,13522600,1225,11633076,
            2715615,19310005,34882128,28975078,39493828,25995655,12012351,1350546,36239841,38241885,660675,24196446,3848925,3921400,248160,26882778,9294516,1790778,12703320,35091253,2948806,9450378,14826735,46556425,1334161,4859403,14405028,16712871,31177356,11127403,7474911,272691,2767128,
            15981031,14696331,1185030,42554925,935028,49228003,35967921,15116751,19697226,1308153,19747470,23822253,4713985,365085,199396,20598571,31868136,7494256,9169903,275653,15873795,35267401,673380,34665301,13926003,2081820,2143485,4534566,49955010,7282836,19810365,30838731,6995670,
            21520080,45167760,28739571,22314540,1063611,1594005,32381128,20387305,23581278,21004921,929566,6765681,2124891,38075901,12642906,4432753,9406953,26335653,4655826,7966036,9664606,39618351,8927425,47419191,13804885,23239153,5390686,20920746,47946528,28937028,8239770,30572290,1408681,1697403,18816045,
            8435778,692076,8154741,10158778,38110815,44457735,10651420,48172020,47741106,33648706,13820653,8638246,12085986,1875016,6619341,15862528,34167511,969528,11240911,238395,2697003,43212456,10577700,3486120,1478340,41537055,32736186,43687878,41037270,479710,385003,8086231,9354975,12382776,
            5299140,159895,509545,14212446,8729931,1360425,8435778,3381300,2847691,49118916,10212940,29318653,7210503,12824580,45053778,10019526,34999161,9127128,35267401,4900015,41564403,18736381,44939940,17237256,15931,26663253,35149920,3785376,15935835,32276595,2305878,8094276,10235550,
            17003196,411778,1949325,23069028,11541610,3686970,132355,2447578,18785385,39201085,11450505,31626,45272370,40055725,1677196,12915903,38311881,10504236,2680770,8567730,16539876,3438753,16886766,755835,16099975,13820653,79401,3131253,24812490,7926171,35688576,1202025,
            46914141,4447653,129286,9903475,18656886,24699906,990528,14212446,42315400,453628,28580580,359976,807085,10149765,42674941,9810235,9204195,35705475,17931066,163306,3451878,21928753,10100265,3579150,22609450,23232336,30455110,2174655,6467406,24168628,41616,7301931,47292675,19571896,
            26796,17668540,8881005,3234696,16413585,38944725,1880830,102831,11715220,5707131,185745,19503135,433846,510555,11681361,1118260,2438736,6644835,2727280,7922190,2145556,32092066,696790,15924546,2364225,3651753,21356380,21737121,12046686,17032366,3337236,41920746,2471976,2653056,1721440,2541385,
            26956153,45148753,26328396,35082876,11604153,31629081,33821200,8775955,889111,21284550,34250226,5064153,4229686,427350,2939100,47117778,9097245,3191601,26714395,14415765,35233815,13033065,484620,23995128,45272370,6441,2616328,26103925,4379320,24496500,3916,4668040,451725,1203576,34915546,
            17955028,36273903,7540786,18075078,455535,20470401,11047350,388521,42693420,174936,1523385,214840,19615716,27472578,12647935,284635,14421135,25902003,97903,1629915,39201085,19247910,21415240,41500605,2063496,2021055,18461926,48555585,42149971,177310,32542278,12839778,3103786,49059465,
            25052581,33101316,2579856,25229856,11431371,10554715,11278875,11527201,9187041,706266,11594520,19310005,37884160,38032281,1100386,15331953,25643541,10878780,24890040,35967921,37623475,854778,1488675,49118916,2168403,44996841,692076,30408301,37147890,48752875,43221753,15293215,36188778,
            11188815,38574936,5208378,11198278,6586635,13747146,303810,37096191,30338155,3415191,1499046,2618616,13695,8054091,7696926,49426653,28557903,318003,10253656,39396126,37666860,31280095,7417026,3280641,28542790,23220,16333470,9225660,123753,1101870,2586675,17865253,
            42536476,21212841,38706801,33468471,16620495,28777491,24335776,5562780,45358050,3342405,7409325,171405,224785,439453,32906328,7134753,11278875,24953580,28053795,13305061,14663820,3555111,9208486,7750,34283340,47662966,1963171,4884375,6438666,9655815,49855105,42039865,7459453,27926601,42416655,25686528,7018131,
            22368016,1710325,640146,26882778,1062153,45806806,49805190,1092981,2463090,12915903,8826301,13372206,42573378,116886,41400450,31796325,19303791,13968255,42795126,41905,8366095,8805306,4486510,8146666,12941328,6189921,9393945,2067561,2286591,3887866,4226778,39236511,963966,17184453,46488903,39467170,31876120,
            3301165,14351403,27368901,17573556,37104805,1057785,10326240,4408965,24140826,1730730,43361328,473851,17467005,9699810,7974021,22757631,36881166,20907811,2929410,528,2518890,38882971,32092066,1072380,40783996,47711796,6374235,19980681,10190355,21539766,37866753,997578,1157481,36546975,25457680,8187081,
            24321825,4787965,45015816,5234230,375411,29733616,53628,43277556,2401336,29188620,12492501,37632150,19453203,18988203,8522256,3158841,13125126,1528626,18009001,650370,34241950,666435,10892778,3768885,1237951,12794211,97461,31470211,2258875,31414701,31019626,10794981,4031380,881128,20706,
            9437340,749700,45367575,21467628,1149886,35275800,10962903,245350,36906936,28113751,16672425,12572605,1701090,43893765,18267990,12809391,5928846,9238551,2941525,23588146,3383901,36932715,49267701,42324600,894453,1301691,27147396,3893445,2669205,4114146,4498500,13652925,34673628,27243271,
            19254115,30478528,1081185,9450378,19879665,4692516,36171765,6876486,31288005,699153,46498546
        ]
        for (in, out) in zip(inputs, expected_outputs)
            @test handshake(in) == out
        end
    end

end # module handshake_test

using .handshake_test
handshake_test.test()