include .env

deploy-goerli:
	forge script script/Deploy.s.sol --rpc-url ${GOERLI_RPC_URL} --broadcast --verify -vvvv"