

CMD=" srun  -N 1 --pty --gres=gpu:a100:1 -p octave -A public python "
#CMD="python"
export http_proxy=127.0.0.1:7890 
export https_proxy=127.0.0.1:7890
set -ex
#basepath=/dataset
basepath=/mnt/octave/data/chenyidong/checkpoint
bit=8
for batch in   32
    do
    for seq in   512
      
        do
  
            models=(  "Llama-2-7b"  ) 
            # data_types=( "mix"  )
            
            # for data_type in "${data_types[@]}"
            #     do
            #     for model in "${models[@]}"
            #         do
            #         echo ${model}          
            #         CUDA_VISIBLE_DEVICES=$1   http_proxy=127.0.0.1:8892 https_proxy=127.0.0.1:8892  \
            #         ${CMD} benchflops.py  --model_type ${data_type} --model_path  \
            #         ${basepath}/quant${bit}/${model} \
            #         --quant_file ${basepath}/quant${bit}/${model} \
            #         --batch_size ${batch} --bit ${bit} \
            #         #--_dataset_path '/code/checkpoint/dataset/wikitext/wikitext-2-raw-v1' 

            #     done
            # done 
            
            # data_types=( "bitsandbytes"   "fp16"   )
            # for data_type in "${data_types[@]}"
            #     do
            #     for model in "${models[@]}"
            #         do
            #         echo ${model}          
            #         CUDA_VISIBLE_DEVICES=$1   http_proxy=127.0.0.1:7890 https_proxy=127.0.0.1:7890  \
            #         ${CMD} benchflops.py  --model_type ${data_type} --model_path  \
            #         ${basepath}/${model} \
            #         --quant_file ${basepath}/${model} --batch_size ${batch}
            #     done
            # done



            data_types=( "awq"   )
            for data_type in "${data_types[@]}"
                do
                for model in "${models[@]}"
                    do
                    echo ${model}
                    CUDA_VISIBLE_DEVICES=$1   http_proxy=127.0.0.1:7890 https_proxy=127.0.0.1:7890  \
                    ${CMD} benchflops.py  --model_type ${data_type} --model_path  \
                    ${basepath}/awqquant/${model} \
                    --quant_file ${basepath}/awqquant/${model} --batch_size ${batch}
                done
            done


         
        done 
done
