################################################################################
##  File:  Install-Bazel.ps1
##  Desc:  Install Bazel and Bazelisk (A user-friendly launcher for Bazel)
################################################################################

Choco-Install -PackageName bazel

npm install -g @bazel/bazelisk

$pkg = choco list --localonly bazel --exact --all --limitoutput
$version = ($pkg -split '\|')[1]
$env:USE_BAZEL_VERSION=$version

Invoke-PesterTests -TestFile "Tools" -TestName "Bazel"