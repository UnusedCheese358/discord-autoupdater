echo "Welcome to the Discord for Linux Auto Update Wizard! (Press CTRL + C to abort)"
echo "歡迎使用 Discord 自動更新器! (如需緊急停止，請按 CTRL + C)"

sleep 3

echo "This wizard requires the following packages to run correctly:"
echo "本自動更新器需要以下軟件包才能運作: "

echo """
    - wget
    - apt (for debian based distro)
"""

echo "Initialising..."
echo "正在啓動..."

sleep 2

echo "Downloading the new source package file..."
echo "正在下載新的資源包..."

# alternative line that works, just use either of them, i don't think you should use both at the same time
# wget --method GET 'http://discord.com/api/download/stable?platform=linux&format=deb'
wget "http://discord.com/api/download/stable?platform=linux&format=deb"
touch discord.deb
cp 'stable?platform=linux&format=deb' 'discord.deb'

echo "Upgrading Discord..."
echo "正在升級 Discord..."

sudo apt install ./discord.deb

echo "Removing the residual package..."
echo "正在移除殘留包..."

# removes the debian package, which you will no longer need
sudo rm -rf ./discord.deb
sudo rm -rf './stable?platform=linux&format=deb'

echo "Upgrade complete! You may open Discord now! Thank you for using the Discord for Linux auto-update wizard!"
echo "升級完成! 可以打開 Discord 了! 感謝您使用 Discord 自動更新器!"
sleep 2

echo "This program will exit automatically in 3 seconds."
echo "此程序將會在3秒後自動關閉．"
sleep 3
