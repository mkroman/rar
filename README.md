# RAR

RAR is a Ruby wrapper for the command-line application `rar`, also known as
WinRAR for Windows. A free evaluation copy can be obtained from [RarLab](http://rarlab.com).

## Installation

`gem install rar`

And you're all set. Extra dependencies will automatically be installed.

## Usage

### Creating an archive

Creating an archive and adding arbitrary files to it is simple!

    require 'rar'

    archive = RAR::Archive.new 'archive.rar'

    archive.add_file 'some-file.txt'
    archive.add_file 'some-other-file.jpg'

    archive.create!

### Adding command-line options

RAR provides a mapping of verbosely named options for ease of use.

    archive = RAR::Archive.new 'archive.rar', volume_size: 15_000_000

    archive.add_file 'some-file.txt'
    archive.add_file 'some-large-file.bin'

    archive.create!

This example splits the archive into multiple volumes with a size of 15MB.

To see more options, take a look at the documentation.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

## History

__v0.1__

+ Initial release.
