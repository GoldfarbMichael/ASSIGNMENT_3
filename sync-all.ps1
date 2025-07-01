# sync-all.ps1

# Set paths
$backend = "212112106_209507763_assignment3.2"
$frontend = "212112106_209507763_assignment3.3"

# Push backend changes
cd $backend
git add .
if (git diff --cached --quiet) {
    Write-Host "No changes in backend."
} else {
    git commit -m "Updated backend"
    git push origin main
}
cd ..

# Push frontend changes
cd $frontend
git add .
if (git diff --cached --quiet) {
    Write-Host "No changes in frontend."
} else {
    git commit -m "Updated frontend"
    git push origin main
}
cd ..

# Update ASSIGNMENT_3 submodule pointers
git add $backend
git add $frontend
$submoduleChanged = -not (git diff --cached --quiet)

# Now check for any other changes in ASSIGNMENT_3
# This includes .env, scripts, docs, etc.
git add -u
git add .  # pick up untracked new files
$wrapperChanged = -not (git diff --cached --quiet)

# Only commit if anything actually changed
if ($submoduleChanged -or $wrapperChanged) {
    git commit -m "Updated ASSIGNMENT_3 content and/or submodule pointers"
    git push origin main
} else {
    Write-Host "No changes in ASSIGNMENT_3."
}
