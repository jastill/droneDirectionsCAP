module.exports = (srv) => {
 
 srv.on ('READ', 'Steps', ()=>[
   { ID:201, step:1, command:"command", parameters:"" },
   { ID:202, step:2, command:"takeoff", parameters:"" },
   { ID:203, step:3, command:"land", parameters:"" }
 ])
}
