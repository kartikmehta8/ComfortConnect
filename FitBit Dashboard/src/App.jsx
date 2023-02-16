import React from 'react';
import {
  Chart as ChartJS, ArcElement, Tooltip, Legend, RadialLinearScale,
  PointElement,
  LineElement,
  LinearScale,
  Filler,
} from 'chart.js';
import { Doughnut, Radar, Scatter } from 'react-chartjs-2';
import faker from 'faker';

ChartJS.register(ArcElement, Tooltip, Legend);
ChartJS.register(LinearScale, PointElement, LineElement, Tooltip, Legend);
ChartJS.register(
  RadialLinearScale,
  PointElement,
  LineElement,
  Filler,
  Tooltip,
  Legend
);

export const options = {
  scales: {
    y: {
      beginAtZero: true,
    },
  },
};

export const data = {
  datasets: [
    {
      label: 'A dataset',
      data: Array.from({ length: 1000 }, () => ({
        x: faker.datatype.number({ min: -50, max: 50 }),
        y: faker.datatype.number({ min: -50, max: 50 }),
      })),
      backgroundColor: 'rgba(255, 99, 132, 1)',
    },
  ],
};

export const dataRa = {
  labels: ['Total Mins of Sleep', 'Total Time in Bed', 'Hours', "Rest"],
  datasets: [
    {
      label: '# of Count',
      data: [17, 15, 21, 10],
      backgroundColor: 'rgba(255, 99, 132, 0.2)',
      borderColor: 'rgba(255, 99, 132, 1)',
      borderWidth: 1,
    },
  ],
};

export const dataPie = {
  labels: ['Good Sleep', 'Excess Sleep', 'Deprieved Sleep'],
  datasets: [
    {
      label: '# of count',
      data: [175, 200, 30],
      backgroundColor: [
        'rgba(255, 99, 132, 0.2)',
        'rgba(54, 162, 235, 0.2)',
        'rgba(255, 206, 86, 0.2)',
        'rgba(75, 192, 192, 0.2)',
        'rgba(153, 102, 255, 0.2)',
        'rgba(255, 159, 64, 0.2)',
      ],
      borderColor: [
        'rgba(255, 99, 132, 1)',
        'rgba(54, 162, 235, 1)',
        'rgba(255, 206, 86, 1)',
        'rgba(75, 192, 192, 1)',
        'rgba(153, 102, 255, 1)',
        'rgba(255, 159, 64, 1)',
      ],
      borderWidth: 1,
    },
  ],
};

export const dataDo = {
  labels: ['Deprieved Sleep', 'Good Sleep', 'Excess Sleep'],
  datasets: [
    {
      label: '# of Votes',
      data: [30, 175, 200],
      backgroundColor: [
        'rgba(255, 99, 132, 0.2)',
        'rgba(54, 162, 235, 0.2)',
        'rgba(255, 206, 86, 0.2)',
        'rgba(75, 192, 192, 0.2)',
        'rgba(153, 102, 255, 0.2)',
        'rgba(255, 159, 64, 0.2)',
      ],
      borderColor: [
        'rgba(255, 99, 132, 1)',
        'rgba(54, 162, 235, 1)',
        'rgba(255, 206, 86, 1)',
        'rgba(75, 192, 192, 1)',
        'rgba(153, 102, 255, 1)',
        'rgba(255, 159, 64, 1)',
      ],
      borderWidth: 1,
    },
  ],
};

export default function App() {
  return <div >
    <div className='flex justify-center text-2xl my-4 mx-2 font-bold' style={{ textAlign: "center" }}>Fitbit Analytics Dashboard </div>
    <div className="flex justify-center">
      <div className="grid grid-cols-2 gap-16 mx-8 my-16">
        <div style={{ height: "600px", width: "600px" }} ><Scatter options={options} data={data} /></div>

        <div style={{ height: "500px", width: "500px" }}><Doughnut data={dataDo} /></div>
      </div>
    </div>
  </div>;
}
