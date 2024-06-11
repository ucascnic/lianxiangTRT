import pstats
import pandas as pd
# 创建Stats对象
p = pstats.Stats("../outputcprof/out_batch1_seq512.out")

 

# 按照运行时间和函数名进行排序
x = p.strip_dirs().sort_stats("tottime", "name").print_stats(10)

 
stats_data = pd.DataFrame(p.stats)
df = stats_data.T
df.columns=[ 'tottime' , 'percall' , 'cumtime' , 'percall' ,'filename:lineno(function)']
print(df)
 

 