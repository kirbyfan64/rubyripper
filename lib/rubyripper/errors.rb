#!/usr/bin/env ruby
#    Rubyripper - A secure ripper for Linux/BSD/OSX
#    Copyright (C) 2007 - 2010  Bouke Woudstra (boukewoudstra@gmail.com)
#
#    This file is part of Rubyripper. Rubyripper is free software: you can
#    redistribute it and/or modify it under the terms of the GNU General
#    Public License as published by the Free Software Foundation, either
#    version 3 of the License, or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>

# This helper class gives the proper phrase for an error code
class Errors
  @@list = {
    :noDiscInDrive => _("There is no audio disc ready in drive %s."),
    :wrongParameters => _("%s does not recognize the parameters used."),
    :unknownDrive => _("The device %s doesn't exist on your system!"),
    :noTrackSelection => _("Please select at least one track."),
    :noCodecSelected => _("Please select at least one codec."),
    :noValidUserInterface => _("No update function found in the user interface"),
    :binaryNotFound => _("%s is needed, but not detected on your system!"),
    :dirNotWritable => _("Can't create output directory!\nYou have no writing access for dir %s"),
  }

private

  def self.method_missing(name, *args)
    #super() if name == '%'
    if @@list.key?(name)
      return _("Error:") + ' ' + @@list[name] % args.to_ary
    else
      puts "WARNING: #{name} {args} not found in error list"
    end  
  end
end