Redmine::Plugin.register :issuecloser do
  name 'Issuecloser plugin'
  author 'Pavel Ishenin'
  description 'Close issues plugin'
  version '1.0.0'
  url 'https://github.com/isheninp/redmine_issue_closer'
  author_url 'https://github.com/isheninp'
  settings :default => {
    :auto_close  => false,
    :auto_close_after_days => 30,
  }, 
  :partial => 'settings/issuecloser'
end
