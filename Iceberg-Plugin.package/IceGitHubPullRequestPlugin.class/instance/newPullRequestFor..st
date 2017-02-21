actions
newPullRequestFor: aRepository 
	(self validateMakePullRequestOn: aRepository) ifFalse: [ ^ #() ].
	
	(IceGitHubPullRequestModel for: aRepository)
		setModal: true; 
		onAccept: [ :pullRequest | 
			[ 
				pullRequest send.
				UIManager default inform: 'Pull request created.' ]
			on: IceGitHubError do: [ :e | self reportError: e ] ];
		openWithSpec 