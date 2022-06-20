printf "export http_proxy=\"http://127.0.0.1:3128\"\nexport https_proxy=\"http://127.0.0.1:3128\"\n" >> ~/.profile && source ~/.profile
printf "Acquire::http::proxy \"http://127.0.0.1:3128/\";\nAcquire::https::proxy \"http://127.0.0.1:3128/\";\n" >> /etc/apt/apt.conf.d/80proxy
printf "channels:\n- defaults\n\nshow_channel_urls: True\nallow_other_channels: True\n\nproxy_servers:\n  http: http://127.0.0.1:3128\n  https: http://127.0.0.1:3128\n\nssl_verify: False\n" >> ~/.condarc
