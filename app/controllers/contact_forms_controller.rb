class ContactFormsController < ApplicationController

  def new
    @contact_form = ContactForm.new
  end

  def create
    begin
        @contact_form = ContactForm.new(contact_form_params)
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

  def contact_form_params
   params.require(:contact_form).permit(:name, :email, :message)
  end
end
