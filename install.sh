# 主程序文件
cp -rf opt /

# 注意：由于是使用root运行的，所以一定要获得实际登录用户
ALL_HOME=`cut -d: -f6 /etc/passwd | grep -E   'root|home' | sort | uniq`

for home in $ALL_HOME; do
  USER=`basename $home`

  for dir in "桌面"  "Desktop" ; do
    if [ -d "$home/$dir/" ]; then
      cp HOME/*  $home/$dir/
      chown $USER:$USER $home/$dir/*
    fi
  done
done

cp HOME/*  /etc/skel/桌面/
cp HOME/*  /etc/skel/Desktop/

exit 0
