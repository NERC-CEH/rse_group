A temporary home for questions that are coming to the RSE group and suggested answers.

## Questions and Answers

### Should I preserve my repository's history when moving it from private to public status?

Edit history is part of your project lifecycle, it could be of use to future maintainers trying to understand why changes were made and how code evolved. It is worth preserving, unless you have good reason not to, when you [https://docs.github.com/en/issues/planning-and-tracking-with-projects/managing-your-project/managing-visibility-of-your-projects](make a private project public) at the end of a contract or to meet publication goals.

There could be cases in which you've shared sensitive information during a project's development (access tokens, or commercially licenced data). If there is not a lot of this, and you are sure you can identify all the cases of it, there are different [tools for filtering changes out of your project's history](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository) - `git filter-repo`, or BFG for more complicated cases.

If, for whatever good reason, you want to publish your project without its history then the "simplest" route is to make a local copy of it without the .git directory that stores its graph of changes, and create a new repository using that copy.

