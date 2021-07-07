require 'redmine'
require_dependency 'redmine_mail_scrubber/hooks'
require_dependency 'redmine_mail_scrubber/mailer_model_patch'

Redmine::Plugin.register :redmine_mail_scrubber do
  name 'Redmine Mail Scrubber plugin'
  author 'Dennis Buehring'
  description 'Removes Redmine Information like Issue-ID/Message-IDs in the subject/mail headers from outgoing mail.'
  version '2.0.0'
  url 'https://github.com/erSitzt/redmine_mail_scrubber'
  author_url 'https://github.com/erSitzt'
end

Rails.configuration.to_prepare do
  unless Mailer.included_modules.include?(RedmineMailScrubber::MailerModelPatch)
    Mailer.send(:prepend, RedmineMailScrubber::MailerModelPatch)
  end
end
