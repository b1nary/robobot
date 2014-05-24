cd ..
rm *.gem
gem build *.gemspec
sudo gem install *.gem
rm *.gem
cd examples
