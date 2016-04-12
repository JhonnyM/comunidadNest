class ContactoMailer < ApplicationMailer

  default from: "Your Mailer <noreply@yourdomain.com>"
  default to: "guayo.mena@gmail.com"

  def new_mensaje(mensaje)
    @mensaje = mensaje

    mail from: "#{mensaje.nombre} <#{mensaje.email}>", subject: mensaje.asunto
  end

  def thank_you_mensaje(mensaje)
    @mensaje = mensaje

    mail subject: "Thank you for contacting us, #{mensaje.nombre}", to: mensaje.email
  end
end
