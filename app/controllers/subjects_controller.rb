class SubjectsController < ApplicationController

	#before_ACTION são ações realizadas pre carregamento de qualquer função do controller
	before_action :find_subject, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit, :show, :index]

	def index
		if params[:semester].blank?
		#declara uma especie de array que recebe e exibe todas as disciplinas em ordem inversa de criação
		@subjects = Subject.all.order("created_at DESC")
		else
			@semester_id = Semester.find_by(semester: params[:semester]).id
			@subjects = Subject.where(:semester_id => @semester_id).order("created_at DESC")

		end

	end

	def show
	
	end


	def new
		#cria a instancia vazia
		#vincula o objeto criado ao usuario logado
		@subject = current_user.subjects.build
		@semesters = Semester.all.map { |c| [c.semester, c.id]}
	end



	def create
		#cria uma nova disciplina
		@subject = current_user.subjects.build(subject_params)
		@subject.semester_id = params[:semester_id]

		#se a disciplina for criada ele redireciona para a index, senão, renderiza o form novamente
		if @subject.save
			redirect_to root_path
		else
			render 'new'	
		end
	end

	def edit
		@semesters = Semester.all.map { |c| [c.semester, c.id]}
	end

	def update
		@subject.semester_id = params[:semester_id]
		if @subject.update(subject_params)
			redirect_to subject_path(@subject)
		else
			render 'edit'
		end
	end



	def destroy
		@subject.destroy
		redirect_to root_path
	end


		private

		def subject_params
			params.require(:subject).permit(:name, :professor, :semester_id, :subject_img)
		end

		def find_subject
			@subject = Subject.find(params[:id])
		end

end
