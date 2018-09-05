openssl aes-256-cbc -K $encrypted_620f792da5a3_key -iv $encrypted_620f792da5a3_iv -in id_rsa.enc -out ~/id_rsa -d
eval "$(ssh-agent -s)" # Start ssh-agent cache
chmod 600 ~/id_rsa # Allow read access to the private key
ssh-add ~/id_rsa # Add the private key to SSH
git config --global push.default matching
git remote add deploy ssh://travis@$IP:$PORT$DEPLOY_DIR
git push deploy

ssh travis@$IP -p $PORT <<EOF
cd $DEPLOY_DIR
   mix run --no-halt
EOF
