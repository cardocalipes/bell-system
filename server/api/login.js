// import { PrismaClient } from '@prisma/client';

// const { username, accessCode } = req.body;

// try {
//   // Check if the credentials are valid
//   const user = await prisma.user_data.findUnique({
//     where: { Username: username, Access_Code: accessCode },
//   });

//   if (user) {
//     return res.status(200).json({ isValid: true });
//   } else {
//     return res.status(401).json({ isValid: false });
//   }
// } catch (error) {
//   console.error('Error during login:', error);
//   return res.status(500).json({ error: 'Internal Server Error' });
// } finally {
//   await prisma.$disconnect(); // Close the Prisma client connection
// }

export default defineEventHandler(async (event) => {
  const body = readBody(event);
  console.log(body);
})
