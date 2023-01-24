## Playing with Actions
<b>A Repository to play around with Github Actions and learn to build useful automation tasks</b>

This is a side project to learn and implement Github Actions. Most of the work is experimental and might be inefficient. These will be addressed in fuuture release as this project grows. The code is written by reading the [Github Docs](https://docs.github.com/en/actions) and suggestions from [ChatGPT](https://chat.openai.com/).

All workflows demonstrated here assume you are following an agile development routine. Agile development focuses on short bursts of productivity rather than building the whole project in one shot. This leads to iterative development which lets developers and testers find flaws with the current implementation.

Open [issue](https://github.com/IamShubhamGupto/playing-with-actions/issues) to discuss request for workflows / ideas (:

## Workflows:
### [Create a release package for each change to 'main' branch](.github/workflows/ci.yml)

Many team contribute to a single sprint branch and then merge with the main branch on passing reviews and test cases. Usually the end of each sprint marks the release of planned / requested features.

Using this workflow, your team has to just push changes to the main branch and the workflow will take care of the rest. This is possible as the workflow is triggered only when there is a push to the main branch using the code here:
```
on:
  push:
    branches:
      - main
```

This can be modified to accept pushes only from a recent type of branches / on pull requests or any other event. You can read about Github events [here](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows).

To give the Actions machine access to the repository, we use ```actions/checkout@v3.3.0```. We then get the current release version and bump the tag version using ```mathieudutour/github-tag-action@v6.1```. Finally, to create a release zip and announcement on github, we use ```ncipollo/release-action@v1```. You can read more about these individual actions on their respective githubs.

### [Create a new sprint branch at the end of current sprint](.github/workflows/create_branch.yml)

After merging the current spring changes with the main branch, naturally, the team starts planning for the next sprint. Apart from planning goals for the next sprint, developers need to setup a new sprint branch. 

This workflow detects when a sprint branch is closed and automatically increments the sprint number. This way developers can focus on just verifying the sprint branch naming convention and start contributing! We assume the convention for the sprint branches is ```sprint/(s/f)yy/sprint-number``` where (s/f) denotes **spring** or **fall**, yy is the last two digits of the current year (20**23**) and sprint-number denotes which sprint the team is on. 

Example: 

If the team is developing in the month of **march** in the year 20**23** on their **3rd** sprint. Then the current branch name would be ```sprint/s23/3```. 

If the team is developing in the month of **december** in the year 20**29** on their **10th** sprint. Then the current branch name would be ```sprint/f29/10```. 

This is just one way of formatting your sprint branches, your team can make adjustments to the update logic and convention based on your development needs.

## References
- https://docs.github.com/en/actions
- https://chat.openai.com/
- https://stackoverflow.com/questions/59175332/using-output-from-a-previous-job-in-a-new-one-in-a-github-action
- https://stackoverflow.com/questions/2111042/how-to-get-the-name-of-the-current-git-branch-into-a-variable-in-a-shell-script
- https://stackoverflow.com/questions/16862933/how-to-resolve-gits-not-something-we-can-merge-error
- https://stackoverflow.com/questions/15884507/trying-to-create-a-string-in-awk-complains-about-division-with-zero
- https://stackoverflow.com/questions/4181703/how-to-concatenate-string-variables-in-bash
- https://github.com/actions/checkout
- https://github.com/mathieudutour/github-tag-action
- https://github.com/ncipollo/release-action
- https://github.com/peterjgrainger/action-create-branch
- https://github.com/rhysd/actionlint

## LICENSE
MIT




