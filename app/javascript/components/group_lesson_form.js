const setGroupLessonForm = () => {
  if (!document.querySelector('#booking_group_session')) return

  document.querySelector('#booking_group_session').addEventListener("change", function(){
    if (document.querySelector('#booking_group_session:checked')){
      document.querySelector(".booking_participants_number").classList.remove("d-none")
    }
    else {
      document.querySelector(".booking_participants_number").classList.add("d-none")

    }
  });
  
}
export default setGroupLessonForm
