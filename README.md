
<!-- README.md is generated from README.Rmd. Please edit that file -->

# concordiaScraper

<!-- badges: start -->
<!-- badges: end -->

`concordiaScraper` is an R package that allows users to interact with
the Itamaraty API for downloading and saving data related to specific
cases in different formats. This package includes functions for
downloading data from a specified page, downloading specific case data
in JSON format, and downloading specific case data in HTML format.

## Installation

You can install the package from GitHub using the devtools package:

``` r
# Install the package from GitHub
remotes::install_github("abjur/concordiaScraper")
```

## Functions

The package includes the following functions:

- `concordia_download_pag(pag, path)`: This function downloads data from
  a specified page of the Itamaraty API. The data is saved in .rds
  format at the specified path.

- `concordia_download_case(id, path)`: This function downloads data for
  a specific case in JSON format from the Itamaraty API. The data is
  saved as a .json file at the specified path.

- `concordia_download_html(id, path)`: This function downloads data for
  a specific case in HTML format from the Itamaraty API. The data is
  saved as a .html file at the specified path.

## Usage

Here is an example of how to use the functions in the concordiaScraper
package:

``` r
# Load the package
library(concordiaScraper)

# Define the path to save the data
path <- "/path/to/save/file"

# Download data from a specific page
concordia_download_pag(1, path)

# Download data for a specific case in JSON format
concordia_download_case(1234, path)

# Download data for a specific case in HTML format
concordia_download_html(1234, path)
```

## Contributing

We welcome contributions to the Concordia package! Please feel free to
submit a pull request or open an issue on the GitHub page.

## License

This project is licensed under the MIT License - see the LICENSE.md file
for details.

## Contact

If you have any questions or need further assistance, please open an
issue on the GitHub page.
