# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
import os
import sys
# Temporary hack. When "current" links are created by `dylan update` in the
# local workspace this can all be replaced by relative links like this:
# ../../_pkg/sphinx-extensions/current/src/sphinxcontrib
join = os.path.join
insert = sys.path.insert
abspath = os.path.abspath
_dylan = os.getenv("DYLAN")
if _dylan is None:
    _dylan = join(os.getenv("HOME"), "dylan")
insert (0, abspath(join(_dylan, 'pkg/sphinx-extensions/0.2.0/src/sphinxcontrib')))
#sys.path.insert(0, os.path.abspath('../..'))
import dylan.themes as dylan_themes


# -- Project information -----------------------------------------------------

project = 'v3d'
copyright = 'Fernando Raya'


# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    'dylan.domain',
    'sphinxcontrib.plantuml'
]

# Necessary to make things like '.. current-module:: foo' work.
primary_domain = 'dylan'

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = []


# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = 'alabaster'
# html_theme = dylan_themes.get_html_theme_default()

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']
