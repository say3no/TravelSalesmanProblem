# Tabu Search
ある地点sの近傍点をs'として、そのn回の試行をまとめたものをS'={s'\_1,s'\_2,...,s'\_n}として、
S'の中から最適なものをs'\_minとする。
その値をs = s'\_min として置き換える。
これを一つのサイクルとして、M回行なう。

この探索法では、sが常に減少するとは限らない。

# Simulated Anealing
TabuSearchではどんな結果であれn回の近傍探索を行なう。
一方SAではやる気システムを導入している。クソみたいな結果がつづいたらさっさと次の点に移る。
たしかSAってそういうのだったような…。