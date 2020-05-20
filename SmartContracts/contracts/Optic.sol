pragma solidity >=0.4.15;
pragma experimental ABIEncoderV2;


contract Optic {
    struct Info {
        string patient_name;
        string patient_surname;
        string patient_patronymic;
        int256 patient_age;
        string prescription_date;
        int256 distance_between_centers;
        int256 id;
        string doctor_name;
        string doctor_surname;
        string doctor_patronymic;
        string doctor_notes;
        mapping(uint256 => left_eye) lefts;
        mapping(uint256 => right_eye) rights;
        mapping(uint256 => Appointment) appoinyments;
    }
    address[] public patients;

    struct left_eye {
        string sph;
        string cyl;
        string ax;
        string pr;
        string pr_base;
    }

    struct right_eye {
        string sph;
        string cyl;
        string ax;
        string pr;
        string pr_base;
    }

    enum Appointment {myopia, farsightedness, none}
    Appointment choice;
    Appointment defaultAppointment = Appointment.none;

    function setAppointment_none() public {
        choice = Appointment.none;
    }

    function setAppointment_myopia() public {
        choice = Appointment.myopia;
    }

    function setAppointment_farsightedness() public {
        choice = Appointment.myopia;
    }

    left_eye public left;

    function Set_left_eye(left_eye memory new_left) public {
        left = new_left;
    }

    function Get_left_eye() public view returns (left_eye memory) {
        return left;
    }

    right_eye public right;

    function Set_right_eye(right_eye memory new_right) public {
        right = new_right;
    }

    function Get_right_eye() public view returns (right_eye memory) {
        return right;
    }

    function Set_patient_name(string memory name_p) public {
        Info.patient_name = name_p;
    }

    function Get_patient_name() public returns (string memory) {
        return Info.patient_name;
    }

    function Set_patient_surname(string memory surname_p) public {
        Info.patient_surname = surname_p;
    }

    function Get_patient_surname() public view returns (string memory) {
        return Info.patient_surname;
    }

    function Set_patient_patronymic(string memory patronymic_p) public {
        Info.patient_patronymic = patronymic_p;
    }

    function Get_patient_patronymic() public view returns (string memory) {
        return Info.patient_patronymic;
    }

    function Set_patient_age(int256 age_p) public {
        Info.patient_age = age_p;
    }

    function Get_patient_age() public view returns (int256) {
        return Info.patient_age;
    }

    function Set_patient_prescription_date(string memory date) public {
        Info.prescription_date = date;
    }

    function Get_patient_prescription_date()
        public
        view
        returns (string memory)
    {
        return Info.prescription_date;
    }

    function Set_distance_between_centers(int256 distance) public {
        Info.distance_between_centers = distance;
    }

    function Get_distance_between_centers() public view returns (int256) {
        return Info.distance_between_centers;
    }

    function Set_doctor_name(string memory name_d) public {
        Info.doctor_name = name_d;
    }

    function Get_doctor_name() public view returns (string memory) {
        return Info.doctor_name;
    }

    function Set_doctor_surname(string memory surname_d) public {
        Info.doctor_surname = surname_d;
    }

    function Get_doctor_surname() public view returns (string memory) {
        return Info.doctor_surname;
    }

    function Set_doctor_patronymic(string memory patronymic_d) public {
        Info.doctor_patronymic = patronymic_d;
    }

    function Get_doctor_patronymic() public view returns (string memory) {
        return Info.doctor_patronymic;
    }

    function Set_doctor_notes(string memory doctor_n) public {
        Info.doctor_notes = doctor_n;
    }

    function Get_doctor_notes() public view returns (string memory) {
        return Info.doctor_notes;
    }

    function register_patient() public {
        Info.id += 1;
        patients.push(
            choice,
            Get_left_eye(),
            Get_right_eye(),
            Get_patient_name(),
            Get_patient_surname(),
            Get_patient_patronymic(),
            Get_patient_age(),
            Get_patient_prescription_date(),
            Get_distance_between_centers(),
            Get_doctor_name(),
            Get_doctor_surname(),
            Get_doctor_patronymic(),
            Get_doctor_notes()
        );
    }

    function get_patient(uint256 id)
        public
        view
        returns (
            address,
            address,
            address,
            string memory,
            string memory,
            string memory,
            int256,
            string memory,
            int256,
            string memory,
            string memory,
            string memory,
            string memory
        )
    {
        Info memory p = patients[id];
        return (
            p.lefts,
            p.rights,
            p.appoinyments,
            p.Get_patient_name(),
            p.Get_patient_surname(),
            p.Get_patient_patronymic(),
            p.Get_patient_age(),
            p.Get_patient_prescription_date(),
            p.Get_distance_between_centers(),
            p.Get_doctor_name(),
            p.Get_doctor_surname(),
            p.Get_doctor_patronymic(),
            p.Get_doctor_notes(),

        );
    }
}
