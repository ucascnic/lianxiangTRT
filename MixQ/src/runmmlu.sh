set -ex

basepath=/dataset


model="Llama-2-7b"

pip uninstall protobuf


# http_proxy=127.0.0.1:8892 https_proxy=127.0.0.1:8892       python examples/eval.py --model_path ${basepath}/${model} \
# --tasks mmlu --n_shot 1 --batch_size 128

#http_proxy=127.0.0.1:8892 https_proxy=127.0.0.1:8892       python examples/eval.py --model_path ${basepath}/${model} --tasks mmlu --n_shot 1 --batch_size 4


http_proxy=127.0.0.1:8892 https_proxy=127.0.0.1:8892       python examples/eval.py --model_path ${basepath}/awqquant/${model}  --tasks mmlu --n_shot 1 --batch_size 128


