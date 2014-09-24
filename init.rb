require 'redmine'

QueriesHelper.module_eval do
  alias query_to_csv_orig query_to_csv
  def query_to_csv(*args)
    ret = query_to_csv_orig(*args)
    if l(:general_csv_encoding) == "UTF-8"
      ret = "\xEF\xBB\xBF".force_encoding("UTF-8")+ret
    end
    ret
  end
end

Redmine::Plugin.register :redmine_csv_with_bom do
  name 'Redmine CSV with BOM plugin'
  author 'TOMITA Masahiro, SERGEY Prosin, Phil Pirozhkov'
  description 'This is a plugin for Redmine to prepend BOM to CSV'
  version '0.0.3'
  url 'http://github.com/pirj/redmine_csv_with_bom'
  author_url 'http://github.com/pirj'
end
