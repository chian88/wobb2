class AppMailer < ApplicationMailer
	def hire_email(application)
		@application = application
		mail to: application.user.email, from: 'info@wobb.com', subject: "You are hired!"
	end

	def apply_email(application)
		@application = application
		mail to: application.job.employer.email, from: 'info@wobb.com', subject: 'Someone applied your job vacancy.'
	end

	def reject_email(application)
		@application = application
		mail to: application.user.email, from: 'info@wobb.com', subject: 'You are being rejected :('
	end

	def send_forgot_password(user)
		@user = user
		mail to: user.email, from: 'info@wobb.com', subject: 'Please reset your password.'
	end
end