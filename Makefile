XCODE_USER_SNIPPETS_DIR=~/Library/Developer/Xcode/UserData/CodeSnippets

SNIPPETS_DIR=Snippets

install_snippets:
	mkdir -p $(XCODE_USER_SNIPPETS_DIR)
	cp -a $(SNIPPETS_DIR)/. $(XCODE_USER_SNIPPETS_DIR)/

uninstall_snippets:
	rm $(XCODE_USER_SNIPPETS_DIR)/Xcode_CodeSnippets_*
