# Pronto runner for Railroader

[![Code Climate](https://codeclimate.com/github/prontolabs/pronto-railroader.png)](https://codeclimate.com/github/prontolabs/pronto-railroader)
[![Build Status](https://travis-ci.org/prontolabs/pronto-railroader.png)](https://travis-ci.org/prontolabs/pronto-railroader)
[![Gem Version](https://badge.fury.io/rb/pronto-railroader.png)](http://badge.fury.io/rb/pronto-railroader)
<!-- [![Dependency Status](https://gemnasium.com/prontolabs/pronto-railroader.png)](https://gemnasium.com/prontolabs/pronto-railroader) -->

Pronto runner for [Railroader](https://github.com/presidentbeef/railroader), security vulnerability scanner for Ruby on Rails (RoR). [What is Pronto?](https://github.com/prontolabs/pronto)

## Severity mapping

Railroader [Confidence](https://github.com/presidentbeef/railroader#confidence-levels) is mapped to severity levels on the
messages generated by Pronto. High confidence maps to fatal, medium confidence maps to warning, and low confidence maps
to info.

## History

Note that Railroader is open source software (OSS) and is a project fork of Brakeman.  This gem, pronto-railroader, is a fork of pronto-brakeman.

If you want a pronto service for Brakeman, use pronto-brakeman instead.
