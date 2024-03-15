export default (req, res) => {
    if (req.method === 'POST') {
      const { email, password } = req.body;
  
      // Validate the username, email, and password
      if (email === 'samercado@evc.pshs.edu.ph' && password === 'Bellsystem_2') {
        res.status(200).json({ user: { email: 'samercado@evc.pshs.edu.ph' } });
      } else {
        res.status(401).json({ message: 'Invalid credentials' });
      }
    } else {
      res.status(405).json({ message: 'Method Not Allowed' });
    }
  };
  