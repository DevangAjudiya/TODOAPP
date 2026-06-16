import {prisma} from "@repo/db/client";

export default async function Home() {
  const users = await prisma.user.findMany();
  return (
    <div>
      <h1>Users</h1>
      {JSON.stringify(users)}
      </div>
  );
}

export const revalidate = 60;
