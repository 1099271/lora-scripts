$Env:HF_HOME="huggingface"

if (!(Test-Path -Path "venv")) {
    Write-Output "���ڴ������⻷��..."
    python -m venv venv
}
.\venv\Scripts\activate

Write-Output "��װ������������ (�ѽ��й��ڼ��٣����޷�ʹ�ü���Դ���� install.ps1)..."
Set-Location .\sd-scripts
pip install torch==1.12.1+cu116 torchvision==0.13.1+cu116 --extra-index-url https://mirror.sjtu.edu.cn/pytorch-wheels
pip install --upgrade -r requirements.txt -i https://mirrors.bfsu.edu.cn/pypi/web/simple
pip install -U -I --no-deps https://jihulab.com/api/v4/projects/82097/packages/pypi/files/e8508fe14c8f2552a822f5e6f5620b24fdd4ba3129c2a31a39b56425bcc023bc/xformers-0.0.14.dev0+torch12-cp310-cp310-win_amd64.whl

Write-Output "��װ bitsandbytes..."
cp .\bitsandbytes_windows\*.dll ..\venv\Lib\site-packages\bitsandbytes\
cp .\bitsandbytes_windows\cextension.py ..\venv\Lib\site-packages\bitsandbytes\cextension.py
cp .\bitsandbytes_windows\main.py ..\venv\Lib\site-packages\bitsandbytes\cuda_setup\main.py