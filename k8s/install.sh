#!/usr/bin/env bash

install_metrics_server (){
    echo "Install & deploy .."
    DOWNLOAD_URL=$(curl -Ls "https://api.github.com/repos/kubernetes-sigs/metrics-server/releases/latest" | jq -r .tarball_url)
    DOWNLOAD_VERSION=$(grep -o '[^/v]*$' <<< $DOWNLOAD_URL)
    curl -Ls $DOWNLOAD_URL -o metrics-server-$DOWNLOAD_VERSION.tar.gz
    mkdir metrics-server-$DOWNLOAD_VERSION
    tar -xzf metrics-server-$DOWNLOAD_VERSION.tar.gz --directory metrics-server-$DOWNLOAD_VERSION --strip-components 1
    kubectl apply -f metrics-server-$DOWNLOAD_VERSION/deploy/1.8+/
    echo "Deployed metrics-server-$DOWNLOAD_VERSION"
    rm -rf metrics-server-$DOWNLOAD_VERSION*
}

result=$(kubectl -n kube-system get deployment/metrics-server 2>&1)
# $? contains the exut code of the most recent command/function
code=$? 
if [ $code -eq 0 ]; then
  echo "Metrics server already installed"
else
    if [[ $result == "error: You must be logged in to the server (Unauthorized)" ]]; then
        echo $result
    else
        install_metrics_server
    fi
fi

