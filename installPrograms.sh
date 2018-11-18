# intall programs in Ubunto-based OS (18.04 >)
# first, download miniconda3 to Downloads from https://conda.io/miniconda.html
# run from Downloads

# update system
sudo apt-get update 
sudo apt-get upgrade

# install miniconda
bash Miniconda3-latest-Linux-x86_64.sh

# install python libraries
conda config --add channels conda-forge
conda install -c anaconda spyder jupyter numpy scipy pandas scikit-learn scikit-image -y
conda install -c conda-forge gdal rasterio rasterstats pyshp rsgislib tuiview tqdm -y
conda install -c rbacher pysptools -y
conda install -c ioos geopandas -y
conda update --all -c conda-forge -y

pip install sentinelhub --upgrade

# install R and RStudio
conda install -c r r-base -y
conda install -c r rstudio -y

# install Java and dependencies to run MaxEnt in R
sudo apt-get update 
sudo apt-get install default-jdk -y
R CMD javareconf
sudo apt-get install r-cran-rjava -y
sudo apt-get install libgdal-dev libproj-dev -y

# install QGIS
sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable
sudo apt-get update
sudo apt-get install qgis -y

# Dropbox
sudo apt-get update
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd

# Inkscape
sudo apt-get update
sudo apt-get install inkscape -y
