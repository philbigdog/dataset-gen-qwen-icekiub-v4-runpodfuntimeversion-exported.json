# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.4.1-base

# install custom nodes into comfyui
RUN comfy-node-install comfyui-kjnodes was-ns ComfyUI_Comfyroll_CustomNodes

# download models and put them into the correct folders in comfyui (one RUN per model)
RUN comfy model download --url https://huggingface.co/Comfy-Org/Qwen-Image-Edit_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_edit_2509_fp8_e4m3fn.safetensors --relative-path models/diffusion_models --filename Qwen-Image-Edit-2509_fp8_e4m3fn.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Qwen-Image-Edit_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_edit_fp8_e4m3fn.safetensors --relative-path models/diffusion_models --filename qwen_image_edit_fp8_e4m3fn.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors --relative-path models/text_encoders --filename qwen_2.5_vl_7b_fp8_scaled.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors --relative-path models/vae --filename qwen_image_vae.safetensors
RUN comfy model download --url https://huggingface.co/lightx2v/Qwen-Image-Lightning/resolve/main/Qwen-Image-Lightning-4steps-V1.0.safetensors --relative-path models/loras --filename Qwen-Image-Lightning-4steps-V1.0.safetensors
RUN comfy model download --url https://huggingface.co/Osrivers/Qwen-Image-Edit-Lightning-8steps-V1.0.safetensors/blob/main/Qwen-Image-Edit-Lightning-8steps-V1.0.safetensors --relative-path models/loras --filename Qwen-Image-Edit-Lightning-8steps-V1.0-bf16.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Qwen-Image-Edit-Remove-Clothing/resolve/main/qwen_image_edit_remove-clothing_v1.0.safetensors --relative-path models/loras --filename qwen_image_edit_remove-clothing_v1.0.safetensors

# copy all input data (like images or videos) into comfyui
#COPY input/ /comfyui/input/
