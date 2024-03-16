<script setup>
import dayjs from "dayjs";

const sched1Data = ref(await useFetch("/api/test/aa").data);

</script>

<template>
<table>
      <tr>
        <td>{{ dayjs(sched1Data.realtime).format("HH:mm") }}</td>
      </tr>
  </table>

</template>