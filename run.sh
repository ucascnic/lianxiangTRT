
 srun  -N 1 --pty --gres=gpu:a100:1 -A h100 -p a100  docker run --rm -it \
   --ipc=host -p 6789:22 -v /home/chenyidong/lianxiang/lianxiangTRT/:/code/tensorrt_llm  \
            -v  /mnt/octave/data/chenyidong/checkpoint:/dataset  \
             -v /home/chenyidong/checkpoint:/code/checkpoint  \
               --ulimit memlock=-1 --ulimit    stack=67108864             \
                           --gpus=all       \
                       --env "CCACHE_DIR=/code/tensorrt_llm/cpp/.ccache"            \
                            --env "CCACHE_BASEDIR=/code/tensorrt_llm"                                      --workdir /app/tensorrt_llm                                                   --hostname hpc-release                                                              --name tensorrt_llm-release-zhanghy                                                                      --tmpfs /tmp:exec                                                                                registry.cn-hangzhou.aliyuncs.com/dongdongchen/dongdong:v1
