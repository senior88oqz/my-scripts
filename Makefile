# $@ is the name of the file to be made.
# $? is the names of the changed dependents.
# $< the name of the related file that caused the action.
# $* the prefix shared by target and dependent files.

EXECUTABLES=	git
$(foreach bin,$(EXECUTABLES),$(if $(shell command -v $(bin) 2> /dev/null),,$(error Please install `$(bin)`)))

.PHONY: git
git: ## Set git config
	@echo "Setting up git..."
	# For better git logs
	@git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
	@git config --global url."git@github.com:".insteadOf "https://github.com"
	@cp git/.gitignore_global ~/.gitignore_global && \
	git config --global core.excludesfile ~/.gitignore_global
	@git config --global user.name "Hongxiang(Khris) Yang"
	@echo "To see a full list of git configs:\n    git config --list"

.PHONY: help
help: ## This help
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		|awk 'BEGIN{FS=":.*?## "};{printf "\033[36m%-30s\033[0m %s\n",$$1,$$2}'