class ContactFormController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end

  def create
    begin
        @contact_form = ContactForm.new(params[:contact_form])
        @contact_form.request = request
        if @contact_form.deliver
          flash.now[:notice] = 'Vielen Dank für deine Nachricht!'
        else
          render :new
        end
      rescue ScriptError
        flash[:error] = 'Sorry, die Nachricht konnte nicht versendet werden.'
      end
  end
end
