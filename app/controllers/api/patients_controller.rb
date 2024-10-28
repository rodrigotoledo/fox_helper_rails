module Api
  class PatientsController < ActionController::API
    before_action :set_patient, only: %i[ show update destroy ]

    # GET /patients or /patients.json
    def index
      @patients = Patient.all
      render json: @patients.as_json(include: :user)
    end

    # GET /patients/1 or /patients/1.json
    def show
      render json: @patient.as_json(include: :user)
    end

    # POST /patients or /patients.json
    def create
      @patient = Patient.new(patient_params)

      if @patient.save
        render @patient.as_json(include: :user), status: :created
      else
        render json: @patient.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /patients/1 or /patients/1.json
    def update
      if @patient.update(patient_params)
        head :ok
      else
        render json: @patient.errors, status: :unprocessable_entity
      end
    end

    # DELETE /patients/1 or /patients/1.json
    def destroy
      @patient.destroy!
      head :no_content
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_patient
        @patient = Patient.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def patient_params
        params.expect(patient: %i[name email responsible phone responsible_phone address emergency_type])
      end
  end
end
