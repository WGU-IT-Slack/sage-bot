eval "$(ssh-agent -s)" # Start ssh-agent cache
chmod 600 .travis/id_rsa # Allow read access to the private key
ssh-add .travis/id_rsa # Add the private key to SSH
git config --global push.default matching
git remote add deploy ssh://travis@$IP:$PORT$DEPLOY_DIR
git push deploy DanMHammer-VPS

ssh travis@$IP -p $PORT <<EOF
cd $DEPLOY_DIR
   mix run --no-halt
EOF
