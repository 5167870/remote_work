function delete_branches --description 'Delete git branches from both: local repo and remote repo'
   for branch in $argv;
      echo "git branch -D $branch;"
      git branch -D $branch;
      echo "git push origin --delete $branch;"
      git push origin --delete $branch;
   end
end

function gup --description 'Update repo from upstream/master'
   git fetch upstream && git checkout master && git merge upstream/master && git push
end
