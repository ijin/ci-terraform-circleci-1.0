# Infrastructure As Code
* Terraformを利用
* VPC, subnet等の管理

## 注意
`master`や`deploy/*` branchへはpushしないように、`protected branches`の設定を推奨

## 開発手順

1. ソースコードを更新
`git checkout master; git pull`

2. ローカルマシンでfeature branchを作成
`git checkout -b new-feature`

3. コード変更し、コミット
`git commit`

4. feature branchをpush
`git push -u origin new-feature`

5. github上でmasterへpull requestを送る

6. コードレビューをし、CIでテスト通過していたらmergeし、branch削除

7. ローカルマシンのfeature branchを削除
`git branch --merged master | grep -v master | grep -v deploy | xargs -n 1 git branch -d`

## 適用手順

1. github上でmasterからdeploy/dev branch（開発環境の場合）へpull requestを送る

2. コードレビューし、CIでテスト通過していたらmerge

