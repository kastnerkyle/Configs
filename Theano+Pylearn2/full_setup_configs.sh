pushd
sudo apt-get install -y screen vim eog
wget http://repo.continuum.io/archive/Anaconda-2.0.1-Linux-x86_64.sh
bash Anaconda*.sh -b
echo 'export PATH=$HOME/anaconda/bin:''$PATH' >> $HOME/.bashrc
source $HOME/.bashrc

#Ubuntu version checking
FULL_VERSION=`lsb_release -a | grep Desc | unexpand | tr -s ' ' | cut -d ':' -f 2 | cut -d ' ' -f 2`
MAJOR_VERSION=`echo "$FULL_VERSION" | cut -d '.' -f 1`
MINOR_VERSION=`echo "$FULL_VERSION" | cut -d '.' -f 2`
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1204/x86_64/cuda-repo-ubuntu1204_5.5-0_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1204_5.5-0_amd64.deb
sudo apt-get update
sudo apt-get install -y cuda-5-5

#THEANO_FLAGS=floatX=float32,device=gpu0 python /usr/local/lib/python2.7/dist-packages/theano/misc/check_blas.py
cd $HOME/src

git clone git://github.com/lisa-lab/pylearn2.git
git clone git://github.com/Theano/Theano.git
cd pylearn2
python setup.py develop 

cd ..
cd Theano
python setup.py develop

cd $HOME
echo 'export PATH=/usr/local/cuda/bin:$PATH' >> .bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH" >> .bashrc
echo "export PYLEARN2_DATA_PATH=$HOME/pylearn2_data" >> .bashrc
echo "export PYLEARN2_VIEWER_COMMAND='eog --new-instance'" >> .bashrc
source $HOME/.bashrc

echo '[global]
floatX = float32
device = gpu0
 
[nvcc]
fastmath = True' > .theanorc

mkdir -p $HOME/pylearn2_data/mnist/
cd $HOME/pylearn2_data/mnist/
wget http://yann.lecun.com/exdb/mnist/train-images-idx3-ubyte.gz
gunzip train-images-idx3-ubyte.gz
wget http://yann.lecun.com/exdb/mnist/train-labels-idx1-ubyte.gz
gunzip train-labels-idx1-ubyte.gz
wget http://yann.lecun.com/exdb/mnist/t10k-images-idx3-ubyte.gz
gunzip t10k-images-idx3-ubyte.gz
wget http://yann.lecun.com/exdb/mnist/t10k-labels-idx1-ubyte.gz
gunzip t10k-labels-idx1-ubyte.gz

mkdir -p $HOME/pylearn2_data/cifar10/
cd $HOME/pylearn2_data/cifar10/
wget http://www.cs.utoronto.ca/~kriz/cifar-10-python.tar.gz
tar xzf *.tar.gz

popd
