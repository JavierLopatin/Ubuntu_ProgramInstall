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

# R packages
conda install -c r r-raster -y
conda install -c conda-forge r-rgdal -y
conda install -c conda-forge r-vegan -y
conda install -c r r-mass -y


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

# install Atom and their dependencies tu run R and Python
# install Atom
wget https://atom.io/download/rpm -O atom.rpm
# install require packages:
conda install ipython ipykernel python-language-server
sudo dnf -y install atom.rpm
# install as many r packages as possible through conda
conda install r-essentials r-igraph
# install the R language server used later on
Rscript -e 'install.packages("languageserver")'
# install hydrogen and terminal
apm install hydrogen hydrogen-launcher platformio-ide-terminal
# install language/IDE plugins
apm install atom-ide-ui ide-python ide-r language-r
# The language-r extension appears to be fairly new, and requires a bit of patching to avoid an error message on startup (does nothing, but still…). 
# If your curious what’s going on here, there are two duplicate snippets with the same name (which makes Atom complain), so we are renaming the duplicates.
sed -i '0,/Grep/{s/Grep/Grep 2/}' ~/.atom/packages/language-r/snippets/language-r.cson
sed -i '0,/Cummulative max/{s/Cummulative max/Cummulative max 2/}' ~/.atom/packages/language-r/snippets/language-r.cson
# We’ll now need to install our R and Python kernels so that Hydrogen knows about them. 
# You may need to supply the path to Minconda’s python3/Rscript binaries explicitly if you have other copies of 
# them on your system.
python3 -m ipykernel install --user
Rscript -e 'IRkernel::installspec()'

