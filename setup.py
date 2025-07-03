from setuptools import setup

APP = ['bonjour_gui.py']
DATA_FILES = []
OPTIONS = {
    'packages': ['zeroconf'],
    'includes': ['socket'],
    'iconfile': 'bonjour.icns',  # optional: add your icon or remove this line
}

setup(
    app=APP,
    name='Bonjour Discovery',
    data_files=DATA_FILES,
    options={'py2app': OPTIONS},
    setup_requires=['py2app'],
)