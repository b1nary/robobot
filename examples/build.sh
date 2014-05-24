cd ..
rm *.gem
gem build *.gemspec
sudo gem install *.gem
cd examples
