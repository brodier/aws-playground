AWS Playground

1. Open CloudShell
2. Install gh cli
     sudo yum install yum-utils
     sudo yum-config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
     sudo yum install gh
3. Login to Github
    create token with repo + workflow and org.read
    gh auth login

sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
