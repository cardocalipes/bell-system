import { ref } from 'vue';
import prisma from '~/server/db/prisma';

const iRef = ref(); 

iRef.value = 5; 

export default defineEventHandler(async () => {
  return await prisma.schedule1.findFirst({
    where: {
      id: iRef.value, 
    },
  });
});
